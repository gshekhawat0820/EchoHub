//
//  AlexaView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI
import SwiftData

struct AlexaView: View {
    @Environment(\.modelContext) var context
    @Query let actions: [Action];
    @State private var isAdmin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView(isAdmin: $isAdmin)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                    .background(primaryColor)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        CategoryView(
                            title: "Favorites ⭐",
                            actions: actions.filter({ $0.favorite == true }),
                            isAdmin: $isAdmin)
                        CategoryView(
                            title: "Household 🏠",
                            actions: actions.filter({ $0.category == "Household" }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            title: "Entertainment 🎥",
                            actions: actions.filter({ $0.category == "Entertainment" }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            title: "Communication 📞",
                            actions: actions.filter({ $0.category == "Communication" }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            title: "Routines ⏰",
                            actions: actions.filter({ $0.category == "Routines" }),
                            isAdmin: $isAdmin
                        )
                        CategoryView(
                            title: "Information & Chores 📋",
                            actions: actions.filter({ $0.category == "Information & Chores" }),
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

