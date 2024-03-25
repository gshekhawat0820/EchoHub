//
//  Constant.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import Foundation
import SwiftUI
import AWSPolly

// DATA
let speaker: Speaker = Speaker()
let householdIcons: [ActionJson] = Bundle.main.decode("Data/household.json")
let entertainmentIcons: [ActionJson] = Bundle.main.decode("Data/entertainment.json")
let communicationIcons: [ActionJson] = Bundle.main.decode("Data/communication.json")
let infoChoresIcons: [ActionJson] = Bundle.main.decode("Data/info_chores.json")
let routinesIcons: [ActionJson] = Bundle.main.decode("Data/routines.json")

// LAYOUT
let primaryColor = Color(red: 0, green: 90/255, blue: 168/255)
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing, alignment: .top), count: 3)
}

struct Voice: Hashable {
    var id: AWSPollyVoiceId;
    var languageCode: AWSPollyLanguageCode;
    var prompt: String;
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id);
        hasher.combine(self.languageCode);
        hasher.combine(self.prompt);
    }
}

let polly = [
    "English": [
        "Salli": Voice(id: .salli, languageCode: .enUS, prompt: "Hi! My name is Salli."),
        "Matthew": Voice(id: .matthew, languageCode: .enUS, prompt: "Hi! My name is Matthew.")
    ],
    "Spanish": [
        "Lucia": Voice(id: .lucia, languageCode: .esES, prompt: "Hola! Mi nombre es Lucia."),
        "Miguel": Voice(id: .miguel, languageCode: .esUS, prompt: "Hola! Mi nombre es Miguel."),
    ],
    "Mandarin": [
        "Zhiyu": Voice(id: .zhiyu, languageCode: .cmnCN, prompt: "你好! 我叫智宇.")
    ],
];
