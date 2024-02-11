//
//  CategoryView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI

struct CategoryView: View {
    
    var title: String
    
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
    }
}

#Preview {
    CategoryView(title: "Household")
        .previewLayout(.sizeThatFits)
        
}
