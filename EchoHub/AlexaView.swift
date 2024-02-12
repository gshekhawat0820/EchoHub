//
//  AlexaView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI
import SwiftData

//@Query var recipes: [Action]
struct AlexaView: View {
//    let householdActions = #Predicate<Action> { action in
//        action.category == "Household"
//    }
    
    @Query var householdActions: [Action];

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .background(Color.white)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0, content: {
                        CategoryView(title: "Household 🏠")
                        LazyVGrid(columns: gridLayout, spacing: 15, content: {
                            ForEach(householdActions) { householdIcon in
                                HouseholdIconView(householdIcon: householdIcon)
                            }
                        })
                        .padding(15)
                        //                    CategoryView(title: "Entertainment 🎥")
                        //                    LazyVGrid(columns: gridLayout, spacing: 15, content: {
                        //                        ForEach(entertainmentIcons) { entertainmentIcon in
                        //                            EntertainmentIconView(entertainmentIcon: entertainmentIcon)
                        //                        }
                        //                    })
                        //                    .padding(15)
                        CategoryView(title: "Communication 📞")
                        CategoryView(title: "Routines ⏰")
                        CategoryView(title: "Information & Chores 📋")
                    })
                })
            }
            .navigationBarBackButtonHidden(true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

