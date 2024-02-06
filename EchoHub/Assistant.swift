//
//  Item.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/5/24.
//

import Foundation
import SwiftData

@Model
final class Assistant {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
