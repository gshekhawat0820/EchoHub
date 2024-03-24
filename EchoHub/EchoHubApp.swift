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
    @State private var passwordExists = KeychainManager.getPassword() != nil;
    var body: some Scene {
        WindowGroup {
            if !passwordExists {
                SetPasswordView(passwordExists: $passwordExists)
            } else {
                AssistantSelectView(passwordExists: $passwordExists)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

class KeychainManager {
    enum KeychainError: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    static func save(service: String, account: String, password: Data) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateEntry
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
    }
    
    static func get(service: String, account: String) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }
    
    static func delete(service: String, account: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        print("successfully deleted password")
    }
    
    static func getPassword() -> String? {
        guard let data = KeychainManager.get(service: "EchoHub", account: "user") else {
            return nil
        }
        let password = String(decoding: data, as: UTF8.self)
        return password
    }
    
    static func savePassword(password: String) {
        do {
            try KeychainManager.save(service: "EchoHub", account: "user", password: password.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
    }
    
    static func deletePassword() {
        do {
            try KeychainManager.delete(service: "EchoHub", account: "user")
        } catch {
            print(error)
        }
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
