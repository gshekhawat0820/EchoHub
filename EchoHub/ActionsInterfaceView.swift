//
//  ActionsInterfaceView.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 2/8/24.
//

import SwiftUI
import SwiftData

struct struct : ActionsInterfaceView {
    var body: some View {
        // Implementation of all the actions

        // Once an action is clicked, the command for that action is converted from action-to-speech
        
        // if (assistant == Alexa) {
            let utterance = AVSpeechUtterance(string: "Alexa, \(/*peform action*/)")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.3

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        // } else {
            let utterance = AVSpeechUtterance(string: "Hey Google, \(/*peform action*/)")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.3
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        // }


        // Assuming that the actions are in a list format
        // List {
            // Section {
                // Perform delete action
                .onDelete(perform: delete)
            // }
        // }

        func delete(indexSet: IndexSet){
            // Delete is performed through swiping motion
            /*actions_list*/.remove(atOffsets: indexSet)
        }
    }
}

