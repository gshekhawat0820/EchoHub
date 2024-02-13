//
//  HouseholdModel.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import Foundation

struct ActionJson: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let description: String
}
