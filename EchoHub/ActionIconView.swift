//
//  HouseholdIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct ActionIconView: View {
    @Binding var isAdmin: Bool;
    @State private var showingSheet = false;
    let assistantName: String;
    let isHomeAssistant: Bool;
    let action: Action;
    var body: some View {
        VStack(spacing: 6, content: {
            ZStack {
                Button(
                    action: {
                        speaker.speak(action: action.prompt)
                    },
                    label: {
                        if isAdmin {
                            Image(uiImage: UIImage(data: action.imageData!)!)
                                .resizable()
                                .frame(width: 90, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                  .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                      .stroke(.black, lineWidth: 3)
                                }
                                .contextMenu {
                                    Button {
                                        showingSheet.toggle();
                                    } label: {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                }
                                .draggable(action.imageData!)
                        }
                        else {
                            Image(uiImage: UIImage(data: action.imageData!)!)
                                .resizable()
                                .frame(width: 90, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                  .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                      .stroke(.black, lineWidth: 3)
                                }
                        }
                    }
                )
            }
//            if isAdmin {
//                Text("\(action.name)")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.center)
//            }
//            else {
//                Text("\(action.name)")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.center)
//            }
            Text("\(action.name)")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        })
        .onChange(of: showingSheet) { }
        .sheet(isPresented: $showingSheet) {
            ActionView(action: action, assistantName: self.assistantName, isHomeAssistant: self.isHomeAssistant);
        }
    }
}
