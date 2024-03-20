//
//  HouseholdIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct ActionIconView: View {
    @State private var showingSheet = false;
    
    let action: Action;
    var body: some View {
        VStack(spacing: 6, content: {
            ZStack {
                Button(
                    action: {
                        speechObject.ActionToSpeech(action_command: action.prompt)
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
            Button(action.name) {
                showingSheet.toggle();
            }
            .font(.title3)
            .fontWeight(.semibold)
        })
        .onChange(of: showingSheet) { }
        .sheet(isPresented: $showingSheet) {
            ActionView(action: action)
        }
    }
}
