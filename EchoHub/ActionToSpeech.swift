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

    func ActionToSpeech(action_command: String) {
        let input = AWSPollySynthesizeSpeechURLBuilderRequest();
        input.text = action_command;
        input.outputFormat = AWSPollyOutputFormat.mp3;

        // TODO: allow user to pick which voice they want...
        input.voiceId = .aditi;
        input.languageCode = .enUS;

        // TODO: if the prompt has already been invoked, retrieve from a cache...
        let builder = AWSPollySynthesizeSpeechURLBuilder.default().getPreSignedURL(input);

        // TODO: if the URL errors, then fall back to default voice...
        builder.continueOnSuccessWith { (awsTask: AWSTask<NSURL>) -> Any? in
            // The result of getPresignedURL task is NSURL.
            // Again, we ignore the errors in the example.

            // TODO: store URL (or actual mp3) in a cache. I believe pre-signed URLs expire
            let url = awsTask.result!

            // Try playing the data using the system AVAudioPlayer
            self.player.replaceCurrentItem(with: AVPlayerItem(url: url as URL));
            self.player.play();

            return nil;
        }
    }
}

