//
//  ContentView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/5/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AssistantSelectView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                NavigationLink(destination: {
                    AlexaView()
                }, label: {
                    Text("Amazon Alexa")
                });
                NavigationLink(destination: {
                    ActionView(action: nil)
                }, label: {
                    Text("Add Action")
                });
            }
            .navigationTitle("Assistant Selection")
        }
    }
}

// Entertainment: Turn on/off TV, Watch something on Prime Video, Music/podcast/radio/audiobooks, Play games, News
// Communication: text, call, broadcast through house, Urgent response
// Routines: morning routine, bedtime routine
// Information & Chores: Set alarm/reminders, Check weather, Check calendar, Grocery list, Reorder purchased items

#Preview {
    AssistantSelectView()
}
