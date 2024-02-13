//
//  HouseholdIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct ActionIconView: View {
    
    let action: Action
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack {
                Button(
                    action: {
                        speechObject.ActionToSpeech(action_command: action.prompt)
                    }, 
                    label: {
                        Image(uiImage: UIImage(data: action.imageData!)!)
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .border(Color.black)
                    }
                )
            }
            NavigationLink(action.name) {
                ActionView(action: action)
            }
            .font(.title3)
            .fontWeight(.semibold)
        })
    }
}
