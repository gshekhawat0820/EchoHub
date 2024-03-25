//
//  HouseholdIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct ActionIconView: View {
    @State private var showingSheet = false;
    @Binding var isAdmin: Bool
    let action: Action;
    var body: some View {
        VStack(spacing: 6, content: {
            ZStack {
                Button(
                    action: {
                        speaker.speak(action: action.prompt)
                    },
                    label: {
                        Image(uiImage: UIImage(data: action.imageData!)!)
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                              .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                  .stroke(.black, lineWidth: 3)
                            }
                    }
                )
            }
            if isAdmin {
                Button(action.name) {
                    showingSheet.toggle();
                }
                .font(.title3)
                .fontWeight(.semibold)
            }
            else {
                Text("\(action.name)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
        })
        .onChange(of: showingSheet) { }
        .sheet(isPresented: $showingSheet) {
            ActionView(action: action)
        }
    }
}
