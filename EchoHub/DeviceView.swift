//
//  DeviceView.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 3/21/24.
//

import SwiftUI
import SwiftData

struct DeviceView: View {
    @Environment(\.modelContext) var context
    @Query let actions: [Action];
    @ObservedObject var alexaFlag: AlexaFlag

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView(alexaFlag: alexaFlag)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 5)
                    .background(primaryColor)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        CategoryView(
                            alexaFlag: alexaFlag,
                            title: "Household 🏠",
                            actions: actions.filter({ $0.category == "Household" })
                        )
                        CategoryView(
                            alexaFlag: alexaFlag,
                            title: "Entertainment 🎥",
                            actions: actions.filter({ $0.category == "Entertainment" })
                        )
                        CategoryView(
                            alexaFlag: alexaFlag,
                            title: "Communication 📞",
                            actions: actions.filter({ $0.category == "Communication" })
                        )
                        CategoryView(
                            alexaFlag: alexaFlag,
                            title: "Routines ⏰",
                            actions: actions.filter({ $0.category == "Routines" })
                        )
                        CategoryView(
                            alexaFlag: alexaFlag,
                            title: "Information & Chores 📋",
                            actions: actions.filter({ $0.category == "Information & Chores" })
                        )
                        Button(action: {
                            deleteAllData()
                        }, label: {
                            Text("Reset SwiftData")
                        })
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
