//
//  EchoHubApp.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/5/24.
//

import SwiftUI
import SwiftData

@main
@MainActor
struct EchoHubApp: App {
    
    init() {
        UserDefaults.standard.register(defaults: [
            "language": "English",
            "voice": "Salli"
        ])
    }

    var body: some Scene {
        WindowGroup {
            AssistantSelectView()
        }
        .modelContainer(sharedModelContainer)
    }
}

@MainActor
let sharedModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Action.self);
        var actionFetchDescriptor = FetchDescriptor<Action>();
        actionFetchDescriptor.fetchLimit = 1;
        
        guard try container.mainContext.fetch(actionFetchDescriptor).count == 0 else { return container }
        
        for icon in householdIcons {
            let action = Action(
                name: icon.name,
                prompt: icon.description,
                category: "Household",
                device: "Amazon Alexa",
                hidden: false,
                favorite: false,
                image: UIImage(named: icon.image)!
            )
            container.mainContext.insert(action)
        }
        
        for icon in entertainmentIcons {
            let action = Action(
                name: icon.name,
                prompt: icon.description,
                category: "Entertainment",
                device: "Amazon Alexa",
                hidden: false,
                favorite: false,
                image: UIImage(named: icon.image)!
            )
            container.mainContext.insert(action)
        }
        
        for icon in communicationIcons {
            let action = Action(
                name: icon.name,
                prompt: icon.description,
                category: "Communication",
                device: "Amazon Alexa",
                hidden: false,
                favorite: false,
                image: UIImage(named: icon.image)!
            )
            container.mainContext.insert(action)
        }
        
        for icon in infoChoresIcons {
            let action = Action(
                name: icon.name,
                prompt: icon.description,
                category: "Information & Chores",
                device: "Amazon Alexa",
                hidden: false,
                favorite: false,
                image: UIImage(named: icon.image)!
            )
            container.mainContext.insert(action)
        }
        
        for icon in routinesIcons {
            let action = Action(
                name: icon.name,
                prompt: icon.description,
                category: "Routines",
                device: "Amazon Alexa",
                hidden: false,
                favorite: false,
                image: UIImage(named: icon.image)!
            )
            container.mainContext.insert(action)
        }
        
        return container;
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()
