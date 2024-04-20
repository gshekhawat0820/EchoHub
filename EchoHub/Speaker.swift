//
//  ActionToSpeech.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 2/8/24.
//

import SwiftUI
import AVFoundation
import AWSPolly

class Speaker {
    let player = AVQueuePlayer();
    let synthesizer = AVSpeechSynthesizer();
    var cache: [Voice: URL] = [:];
    
    init() {
        player.actionAtItemEnd = .pause;
        
        AVSpeechSynthesisVoice.speechVoices();
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: nil
        ) { [weak self] _ in
            self?.advance();
        };
    }
    
    func advance() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.player.advanceToNextItem()
            self?.player.play();
        }
    }
    
    func getStringLanguageCode(voiceId: AWSPollyVoiceId) -> String {
        switch voiceId {
        case .salli:
            return "en-US"
        case .matthew:
            return "en-US"
        case .lucia:
            return "es-ES"
        case .miguel:
            return "es-US"
        case .zhiyu:
            return "zh-CN"
        default:
            return "en-US"
        }
    }
    
    func useAppleSynthesizer(action: String, langCode: String) {
        let utterance = AVSpeechUtterance(string: action);
        utterance.voice = AVSpeechSynthesisVoice(language: langCode);
        utterance.rate = 0.5;
        
        self.synthesizer.speak(utterance);
    }
    
    func speak(
        action: String,
        voice: (AWSPollyVoiceId, AWSPollyLanguageCode)? = nil
    ) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch {
            print("Error playing sound")
        }
        
        let input = AWSPollySynthesizeSpeechURLBuilderRequest();
        
        if action.hasPrefix("Alexa,") {
            let prefix = "Alexa,"
            let modifiedAction = "<speak>\(prefix) <break time='2s'/>\(String(action.dropFirst(prefix.count)))</speak>"
            input.textType = .ssml
            input.text = modifiedAction
        } else if action.hasPrefix("Hey Google,") {
            let prefix = "Hey Google,"
            let modifiedAction = "<speak>\(prefix) <break time='2s'/>\(String(action.dropFirst(prefix.count)))</speak>"
            input.textType = .ssml
            input.text = modifiedAction
        } else {
            input.text = action
        }
        
        input.outputFormat = AWSPollyOutputFormat.mp3;
        
        
        if let voice = voice {
            input.voiceId = voice.0;
            input.languageCode = voice.1;
        } else {
            let defaultLanguage = UserDefaults.standard.string(forKey: "language")!;
            let defaultVoice = UserDefaults.standard.string(forKey: "voice")!;
            
            if let pollyLanguage = polly[defaultLanguage] {
                if let pollyVoice = pollyLanguage[defaultVoice] {
                    input.voiceId = pollyVoice.id;
                    input.languageCode = pollyVoice.languageCode;
                } else {
                    print("ERROR: invalid default voice");
                    
                    var langCode: String;
                    switch defaultLanguage {
                    case "English":
                        langCode = "en-US"
                    case "Spanish":
                        langCode = "es-US"
                    case "Mandarin":
                        langCode = "zh-CN"
                    default:
                        langCode = "en-US"
                    }
                    
                    self.useAppleSynthesizer(action: action, langCode: langCode);
                    return;
                }
            } else {
                print("ERROR: invalid default language");
                self.useAppleSynthesizer(action: action, langCode: "en-US");
                return;
            }
        }
        
        // If the prompt has already been invoked, retrieve from a cache...
        let voice = Voice(id: input.voiceId, languageCode: input.languageCode, prompt: input.text);
        if let url = self.cache[voice] {
            print("Using cached URL");
            self.player.insert(AVPlayerItem(url: url as URL), after: self.player.items().last);
            self.player.play();
            return;
        }
        
        // TODO: if not connected to internet, fall back to https://developer.apple.com/documentation/avfaudio/avspeechsynthesisvoice
        let builder = AWSPollySynthesizeSpeechURLBuilder.default().getPreSignedURL(input);
        
        // TODO: if the URL errors, then fall back to default voice...
        builder.continueOnSuccessWith { (awsTask: AWSTask<NSURL>) -> Any? in
            if let error = awsTask.error {
                print("ERROR: AWS Polly task", error);
                let langCode = self.getStringLanguageCode(voiceId: input.voiceId);
                self.useAppleSynthesizer(action: action, langCode: langCode);
                return nil;
            }
            
            if awsTask.isCancelled || awsTask.isFaulted {
                print("ERROR: AWS Polly task cancelled");
                let langCode = self.getStringLanguageCode(voiceId: input.voiceId);
                self.useAppleSynthesizer(action: action, langCode: langCode);
                return nil;
            }
            
            // The result of getPresignedURL task is NSURL.
            if let url = awsTask.result {
                // Try playing the data using the system AVAudioPlayer
                print("Playing URL audio");
                self.player.insert(AVPlayerItem(url: url as URL), after: self.player.items().last);
                self.player.play();
                
                self.cache[voice] = url as URL;
                return nil;
            }
            
            print("ERROR: AWS Polly task does not have URL");
            let langCode = self.getStringLanguageCode(voiceId: input.voiceId);
            self.useAppleSynthesizer(action: action, langCode: langCode);
            return nil;
        }
    }
}

