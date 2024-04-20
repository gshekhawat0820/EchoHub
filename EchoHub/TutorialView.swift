//
//  TutorialView.swift
//  EchoHub
//
//  Created by Sambujang Fofana on 4/16/24.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    DisclosureGroup("How to Select a Device", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the home screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Choose device")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Language and Speaker Voice", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the home screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Click the Settings icon at the top right of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Select language")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Select speaker voice")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Turn on Administrative Mode", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Click the lock icon at the top right of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Enter your password")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Turn off Administrative Mode", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Click the unlock icon at the top right of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Reset Password", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the home screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Click Reset Password at the bottom of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Enter new password")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Play an Action Prompt", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Click on the icon of any action to play a prompt")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Add an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Click on the plus icon at the top right of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Click on Submit to save new changes")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Edit an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Long press on the icon that you wish to edit")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Click Edit")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 5: Click on Submit to save new changes")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Name of an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Enter new name")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Prompt of an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Enter new prompt")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Icon of an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Click on Set Icon")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Category of an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Select category")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Hide/Unhide an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Toggle on/off Hide")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Favorite/Unfavorite an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Toggle on/off Favorite")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Delete an Action", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Enter Administrative Mode")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 3: Edit Action")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                            
                            Text("Step 4: Click on Delete at the bottom of the screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                    
                    DisclosureGroup("How to Change the Order of Icons in a Category", content: {
                        VStack(alignment: .leading, spacing: 5) {Text("Step 1: Navigate to the action selection screen")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 10)
                            
                            Text("Step 2: Press and drag the icon that you wish to move to a new location")
                                .font(.system(size: 16)) .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.top, 5)
                        }.frame(maxWidth: .infinity, alignment: .leading)})
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .font(.system(size: 12)) .fontWeight(.heavy)
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }.navigationTitle("EchoHub Tutorial")
        }
    }
}

#Preview {
    TutorialView()
}
