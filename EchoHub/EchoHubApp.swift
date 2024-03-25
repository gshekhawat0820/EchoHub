//
//  EchoHubApp.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/5/24.
//

import SwiftUI
import SwiftData

class AlexaFlag: ObservableObject {
  @Published var isAlexa = false
}

@main
@MainActor
struct EchoHubApp: App {
    @StateObject var alexaFlag = AlexaFlag()
    
    var body: some Scene {
        WindowGroup {
            AssistantSelectView(alexaFlag: alexaFlag)
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
        
        if AlexaFlag().isAlexa == true {
            for icon in AlHouseholdIcons {
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
            
            for icon in AlEntertainmentIcons {
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
            
            for icon in AlCommunicationIcons {
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
            
            for icon in AlInfoChoresIcons {
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
            
            for icon in AlRoutinesIcons {
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
        } else {
            for icon in GoHouseholdIcons {
                let action = Action(
                    name: icon.name,
                    prompt: icon.description,
                    category: "Household",
                    device: "Google Home",
                    hidden: false,
                    favorite: false,
                    image: UIImage(named: icon.image)!
                )
                container.mainContext.insert(action)
            }
            
            for icon in GoEntertainmentIcons {
                let action = Action(
                    name: icon.name,
                    prompt: icon.description,
                    category: "Entertainment",
                    device: "Google Home",
                    hidden: false,
                    favorite: false,
                    image: UIImage(named: icon.image)!
                )
                container.mainContext.insert(action)
            }
            
            for icon in GoCommunicationIcons {
                let action = Action(
                    name: icon.name,
                    prompt: icon.description,
                    category: "Communication",
                    device: "Google Home",
                    hidden: false,
                    favorite: false,
                    image: UIImage(named: icon.image)!
                )
                container.mainContext.insert(action)
            }
            
            for icon in GoInfoChoresIcons {
                let action = Action(
                    name: icon.name,
                    prompt: icon.description,
                    category: "Information & Chores",
                    device: "Google Home",
                    hidden: false,
                    favorite: false,
                    image: UIImage(named: icon.image)!
                )
                container.mainContext.insert(action)
            }
            
            for icon in GoRoutinesIcons {
                let action = Action(
                    name: icon.name,
                    prompt: icon.description,
                    category: "Routines",
                    device: "Google Home",
                    hidden: false,
                    favorite: false,
                    image: UIImage(named: icon.image)!
                )
                container.mainContext.insert(action)
            }
        }
        
        return container;
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()
