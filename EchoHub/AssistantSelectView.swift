//
//  ContentView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/5/24.
//

import SwiftUI
import SwiftData

struct AssistantSelectView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var assistants: [Assistant]

    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                NavigationLink(destination: {
                    AlexaView()
                }, label: {
                    Text("Amazon Alexa")
                });
                NavigationLink(destination: {
                    GoogleView()
                }, label: {
                    Text("Google Home")
                });
            }
            .navigationTitle("Assistant Selection")
        }
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Poop at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

// Household:Thermostat, Lighting, Lock/Unlock Doors
// Entertainment: Turn on/off TV, Watch something on Prime Video, Music/podcast/radio/audiobooks, Play games, News
// Communication: text, call, broadcast through house, Urgent response
// Routines: morning routine, bedtime routine
// Information & Chores: Set alarm/reminders, Check weather, Check calendar, Grocery list, Reorder purchased items

struct GoogleView: View {
    var body: some View {
        Text("Hey Google")
    }
}

#Preview {
    AssistantSelectView()
        .modelContainer(for: Assistant.self, inMemory: true)
}
