//
//  HouseholdIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct HouseholdIconView: View {
    
    let householdIcon: HouseholdIcon
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack {
                Button(action: {
                    speechObject.ActionToSpeech(action_command: householdIcon.description)
                }, label: {
                    Image(householdIcon.image)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                )
            }
            Text(householdIcon.name)
                .font(.title3)
                .fontWeight(.semibold)
        })
    }
}

//#Preview {
//    HouseholdIconView(householdIcon: householdIcons[0])
//        .previewLayout(.fixed(width: 200, height: 300))
//        .padding()
//}
