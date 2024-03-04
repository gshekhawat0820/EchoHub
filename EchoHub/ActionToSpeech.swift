//
//  ActionToSpeech.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 2/8/24.
//

import SwiftUI
import AVFoundation

class ActionToSpeech {
    init() {
        AVSpeechSynthesisVoice.speechVoices()
    }
    @State var synthesizer = AVSpeechSynthesizer()

    func ActionToSpeech(action_command: String) {
        let utterance = AVSpeechUtterance(string: "\(action_command)")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
}

