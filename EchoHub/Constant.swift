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
let householdIcons: [HouseholdIcon] = Bundle.main.decode("Data/household.json")
let entertainmentIcons: [EntertainmentIcon] = Bundle.main.decode("Data/entertainment.json")

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 3)
}
