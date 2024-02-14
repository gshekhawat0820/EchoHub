//
//  Constant.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import Foundation
import SwiftUI

// DATA
let speechObject: ActionToSpeech = ActionToSpeech()
let householdIcons: [ActionJson] = Bundle.main.decode("Data/household.json")
let entertainmentIcons: [ActionJson] = Bundle.main.decode("Data/entertainment.json")
let communicationIcons: [ActionJson] = Bundle.main.decode("Data/communication.json")
let infoChoresIcons: [ActionJson] = Bundle.main.decode("Data/info_chores.json")
let routinesIcons: [ActionJson] = Bundle.main.decode("Data/routines.json")

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing, alignment: .top), count: 3)
}
