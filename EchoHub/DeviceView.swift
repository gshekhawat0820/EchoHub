//
//  DeviceView.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 3/21/24.
//

import SwiftUI
import SwiftData

struct DeviceView: View {
    @State private var isAdmin = false;
    @Binding var passwordExists: Bool;
    @Binding var emailExists: Bool;
    let assistantName: String;
    let isHomeAssistant: Bool;
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView(isAdmin: $isAdmin, passwordExists: $passwordExists, emailExists: $emailExists, assistantName: self.assistantName, isHomeAssistant: self.isHomeAssistant)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                    .background(primaryColor)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        FavoriteView(
                            assistantName: self.assistantName,
                            isAdmin: $isAdmin,
                            isHomeAssistant: self.isHomeAssistant
                        )

                        if (!self.isHomeAssistant) {
                            CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Talk",
                                emoji: "🗣️",
                                isAdmin: $isAdmin
                            )
                        } else  {
                          CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Household",
                                emoji: "🏠",
                                isAdmin: $isAdmin
                            )
                            CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Entertainment",
                                emoji: "🎥",
                                isAdmin: $isAdmin
                            )
                            CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Communication",
                                emoji: "📞",
                                isAdmin: $isAdmin
                            )
                            CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Routines",
                                emoji: "⏰",
                                isAdmin: $isAdmin
                            )
                            CategoryView(
                                isHomeAssistant: self.isHomeAssistant,
                                assistantName: self.assistantName,
                                category: "Information & Chores",
                                emoji: "📋",
                                isAdmin: $isAdmin
                            )
                        }
                    })
                })
            }
            .navigationBarBackButtonHidden(true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
