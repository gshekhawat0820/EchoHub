//
//  DeviceView.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 3/21/24.
//

import SwiftUI
import SwiftData

struct DeviceView: View {
    @Environment(\.modelContext) var context;
    @State private var isAdmin = false;
    @Query let actions: [Action];
    
    let assistantName: String;

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView(isAdmin: $isAdmin, assistantName: self.assistantName)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                    .background(primaryColor)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Favorites ⭐",
                            actions: actions.filter({ $0.favorite == true && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Household 🏠",
                            actions: actions.filter({ $0.category == "Household" && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Entertainment 🎥",
                            actions: actions.filter({ $0.category == "Entertainment" && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Communication 📞",
                            actions: actions.filter({ $0.category == "Communication" && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Routines ⏰",
                            actions: actions.filter({ $0.category == "Routines" && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            assistantName: self.assistantName,
                            title: "Information & Chores 📋",
                            actions: actions.filter({ $0.category == "Information & Chores" && $0.device == self.assistantName }),
                            isAdmin: $isAdmin
                        )
                    })
                })
            }
            .navigationBarBackButtonHidden(true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
    func deleteAllData() {
        do {
            try context.delete(model: Action.self)
        } catch {
            print("Could not delete Actions")
        }
    }
}
