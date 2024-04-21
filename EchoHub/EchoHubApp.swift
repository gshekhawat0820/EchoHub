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
            "voice": "Salli",
        ])
    }

    @State private var passwordExists = KeychainManager.getPassword() != nil;
    @State private var emailExists = KeychainManager.getEmail() != nil;
    @State private var confirm = false;
                
    var body: some Scene {
        WindowGroup {
            if emailExists {
                if !passwordExists {
                    SetPasswordView(passwordExists: $passwordExists)
                } else {
                    AssistantSelectView(passwordExists: $passwordExists, emailExists: $emailExists, confirm: $confirm)
                }
            }
            else {
                SetEmailView(emailExists: $emailExists)
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
        
    }
    
    static func getPassword() -> String? {
        guard let data = KeychainManager.get(service: "password", account: "EchoHub") else {
            return nil
        }
        let password = String(decoding: data, as: UTF8.self)
        return password
    }
    
    static func savePassword(password: String) {
        do {
            try KeychainManager.save(service: "password", account: "EchoHub", password: password.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
    }
    
    static func deletePassword() {
        do {
            try KeychainManager.delete(service: "password", account: "EchoHub")
        } catch {
            print(error)
        }
        print("successfully deleted password")
    }
    
    static func getEmail() -> String? {
        guard let data = KeychainManager.get(service: "email", account: "EchoHub") else {
            return nil
        }
        let password = String(decoding: data, as: UTF8.self)
        return password
    }
    
    static func saveEmail(email: String) {
        do {
            try KeychainManager.save(service: "email", account: "EchoHub", password: email.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
    }
    
    static func deleteEmail() {
        do {
            try KeychainManager.delete(service: "email", account: "EchoHub")
        } catch {
            print(error)
        }
        print("successfully deleted email")
    }
}

@MainActor
let sharedModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Action.self);
        var actionFetchDescriptor = FetchDescriptor<Action>();
        actionFetchDescriptor.fetchLimit = 1;
        
        guard try container.mainContext.fetch(actionFetchDescriptor).count == 0 else { return container }
        
        let defaults = [
            "Amazon Alexa": [
                "Household": AlHouseholdIcons,
                "Entertainment": AlEntertainmentIcons,
                "Communication": AlCommunicationIcons,
                "Information & Chores": AlInfoChoresIcons,
                "Routines": AlRoutinesIcons
            ],
            "Google Home": [
                "Household": GoHouseholdIcons,
                "Entertainment": GoEntertainmentIcons,
                "Communication": GoCommunicationIcons,
                "Information & Chores": GoInfoChoresIcons,
                "Routines": GoRoutinesIcons
            ]
        ];
        
        for (device, categories) in defaults {
            for (category, icons) in categories {
                for (index, icon) in icons.enumerated() {
                    let action = Action(
                        name: icon.name,
                        prompt: icon.description,
                        category: category,
                        device: device,
                        hidden: false,
                        favorite: false,
                        image: UIImage(named: icon.image)!,
                        order: index
                    );
                    container.mainContext.insert(action)
                }
            }
        }

        return container;
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()
