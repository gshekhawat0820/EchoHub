//
//  AlexaView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI
import SwiftData

struct AlexaView: View {
    @Query let actions: [Action];

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .background(Color.white)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        CategoryView(
                            title: "Household 🏠",
                            actions: actions.filter({ $0.category == "Household" })
                        )
                        CategoryView(
                            title: "Entertainment 🎥",
                            actions: actions.filter({ $0.category == "Entertainment" })
                        )
                        CategoryView(
                            title: "Communication 📞",
                            actions: actions.filter({ $0.category == "Communication" })
                        )
                        CategoryView(
                            title: "Routines ⏰",
                            actions: actions.filter({ $0.category == "Routines" })
                        )
                        CategoryView(
                            title: "Information & Chores 📋",
                            actions: actions.filter({ $0.category == "Information & Chores" })
                        )
                    })
                })
            }
            .navigationBarBackButtonHidden(true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

