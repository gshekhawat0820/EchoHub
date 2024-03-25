//
//  CategoryView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var alexaFlag: AlexaFlag
    
    var title: String
    var actions: [Action]
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
        LazyVGrid(columns: gridLayout, spacing: 15, content: {
            ForEach(actions) { action in
                ActionIconView(alexaFlag: alexaFlag, action: action)
            }
        })
        .padding(15)
    }
}
