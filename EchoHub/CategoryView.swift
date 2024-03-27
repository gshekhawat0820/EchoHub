//
//  CategoryView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct CategoryView: View {
    let assistantName: String;
    
    var title: String
    var actions: [Action]
    @Binding var isAdmin: Bool
    
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
                if (isAdmin || !action.hidden) {
                    ActionIconView(isAdmin: $isAdmin, assistantName: self.assistantName, action: action)
                }
            }
        })
        .padding(15)
    }
}

#Preview {
    CategoryView(assistantName: "Amazon Alexa", title: "Household", actions: [], isAdmin: .constant(false))
        .previewLayout(.sizeThatFits)
        
}
