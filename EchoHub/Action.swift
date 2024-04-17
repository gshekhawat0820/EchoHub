//
//  Action.swift
//  EchoHub
//
//  Created by Eric Lau on 2/9/24.
//

import SwiftData
import Foundation
import SwiftUI

@Model
class Action {
    var name: String;
    var prompt: String;
    var category: String;
    var device: String;
    var hidden: Bool;
    var favorite: Bool;
    var order: Int?;
    
    @Attribute(.externalStorage)
    var imageData: Data?;
    
    init(name: String, prompt: String, category: String, device: String, hidden: Bool, favorite: Bool, image: UIImage) {
        self.name = name;
        self.prompt = prompt;
        self.category = category;
        self.device = device;
        self.hidden = hidden;
        self.favorite = favorite;
        self.imageData = image.pngData();
        self.order = nil;
    }
}
