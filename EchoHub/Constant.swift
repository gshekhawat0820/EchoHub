//
//  Constant.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import Foundation
import SwiftUI

// Amazon Alexa DATA
let speechObject: ActionToSpeech = ActionToSpeech()
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

// LAYOUT
let primaryColor = Color(red: 0, green: 90/255, blue: 168/255)
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing, alignment: .top), count: 3)
}
