//
//  Constant.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import Foundation
import SwiftUI
import AWSPolly
import SendGrid

let speaker: Speaker = Speaker()

// Amazon Alexa DATA
let AlHouseholdIcons: [ActionJson] = Bundle.main.decode("Data/Alexa Data/alexaHousehold.json")
let AlEntertainmentIcons: [ActionJson] = Bundle.main.decode("Data/Alexa Data/alexaEntertainment.json")
let AlCommunicationIcons: [ActionJson] = Bundle.main.decode("Data/Alexa Data/alexaCommunication.json")
let AlInfoChoresIcons: [ActionJson] = Bundle.main.decode("Data/Alexa Data/alexaInfo_chores.json")
let AlRoutinesIcons: [ActionJson] = Bundle.main.decode("Data/Alexa Data/alexaRoutines.json")

// Google Home DATA
let GoHouseholdIcons: [ActionJson] = Bundle.main.decode("Data/Google Data/googleHousehold.json")
let GoEntertainmentIcons: [ActionJson] = Bundle.main.decode("Data/Google Data/googleEntertainment.json")
let GoCommunicationIcons: [ActionJson] = Bundle.main.decode("Data/Google Data/googleCommunication.json")
let GoInfoChoresIcons: [ActionJson] = Bundle.main.decode("Data/Google Data/googleInfo_chores.json")
let GoRoutinesIcons: [ActionJson] = Bundle.main.decode("Data/Google Data/googleRoutines.json")

// Picture Board DATA
let PictureBoardIcons: [ActionJson] = []

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

let sendGridAPIKey = Bundle.main.infoDictionary?["SENDGRID_API_KEY"] as? String
let sendGridEmail: Address = "echohubfeedback@gmail.com"
