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
    @State private var showingTutorialSheet = false;
    @State private var showingSettingsSheet = false;
    @Binding var passwordExists: Bool;
    @Binding var emailExists: Bool;
    @Binding var confirm: Bool;
    var body: some View {
        NavigationStack {
            ZStack {
                primaryColor.ignoresSafeArea()
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Button(
                            action: {
                                showingTutorialSheet.toggle();
                            }
                        ) {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundStyle(.white)
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Button(
                            action: {
                                showingSettingsSheet.toggle();
                            }
                        ) {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.white)
                                .padding()
                        }
                        Spacer()
                    }
                }
                VStack(spacing: 50) {
                    Text("Welcome to EchoHub")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 50))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    Image(systemName: "homepodmini.2.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 115, height: 100)
                    Text("Please select an option below: ")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                        .fontWeight(.light)
                    NavigationLink(destination: {
                        DeviceView(passwordExists: $passwordExists, emailExists: $emailExists, confirm: $confirm, assistantName: "Amazon Alexa", isHomeAssistant: true)
                    }, label: {
                        Text("Amazon Alexa")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white, lineWidth: 2)
                            )
                    });
                    NavigationLink(destination: {
                        DeviceView(passwordExists: $passwordExists, emailExists: $emailExists, confirm: $confirm, assistantName: "Google Home", isHomeAssistant: true)
                    }, label: {
                        Text("Google Home")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white, lineWidth: 2)
                            )
                    });
                    NavigationLink(destination: {
                        DeviceView(passwordExists: $passwordExists, emailExists: $emailExists, confirm: $confirm, assistantName: "Picture Board", isHomeAssistant: false)
                    }, label: {
                        Text("Picture Board")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white, lineWidth: 2)
                            )
                    });
                }
            }.sheet(isPresented: $showingSettingsSheet) {
                SettingsView(passwordExists: $passwordExists, emailExists: $emailExists, confirm: $confirm)
            }.sheet(isPresented: $showingTutorialSheet) {
                TutorialView()
            }
        }
    }
}

// Entertainment: Turn on/off TV, Watch something on Prime Video, Music/podcast/radio/audiobooks, Play games, News
// Communication: text, call, broadcast through house, Urgent response
// Routines: morning routine, bedtime routine
// Information & Chores: Set alarm/reminders, Check weather, Check calendar, Grocery list, Reorder purchased items

#Preview {
    AssistantSelectView(passwordExists: .constant(true), emailExists: .constant((true)), confirm: .constant(true));
}
