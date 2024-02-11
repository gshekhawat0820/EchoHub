//
//  EntertainmentIconView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/11/24.
//

import SwiftUI

struct EntertainmentIconView: View {
    
    let entertainmentIcon: EntertainmentIcon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack {
                Image(entertainmentIcon.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            Text(entertainmentIcon.name)
                .font(.title3)
                .fontWeight(.semibold)
        })
    }
}

#Preview {
    EntertainmentIconView(entertainmentIcon: entertainmentIcons[0])
        .previewLayout(.fixed(width: 200, height: 300))
        .padding()
}
