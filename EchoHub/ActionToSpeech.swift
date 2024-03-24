//
//  ActionToSpeech.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 2/8/24.
//

import SwiftUI
import AVFoundation
import AWSPolly

class ActionToSpeech {
    let player = AVPlayer();

    func ActionToSpeech(
        action_command: String,
        voice: (AWSPollyVoiceId, AWSPollyLanguageCode)? = nil
    ) {
        let input = AWSPollySynthesizeSpeechURLBuilderRequest();
        input.text = action_command;
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
                    print("ERROR: invalid default voice")
                }
            } else {
                print("ERROR: invalid default language")
            }
        }

        // TODO: if not connected to internet, fall back to https://developer.apple.com/documentation/avfaudio/avspeechsynthesisvoice

        // TODO: if the prompt has already been invoked, retrieve from a cache...
        let builder = AWSPollySynthesizeSpeechURLBuilder.default().getPreSignedURL(input);

        // TODO: if the URL errors, then fall back to default voice...
        builder.continueOnSuccessWith { (awsTask: AWSTask<NSURL>) -> Any? in
            if let error = awsTask.error {
                print(error)
                // TODO: fallback
                return nil;
            }
            
            if awsTask.isCancelled || awsTask.isFaulted {
                // TODO: fallback
                return nil;
            }

            // The result of getPresignedURL task is NSURL.
            // TODO: store URL (or actual mp3) in a cache. I believe pre-signed URLs expire
            if let url = awsTask.result {
                // Try playing the data using the system AVAudioPlayer
                self.player.replaceCurrentItem(with: AVPlayerItem(url: url as URL));
                self.player.play();
                return nil;
            }
            
            // TODO: fallback
            return nil;
        }
    }
}

