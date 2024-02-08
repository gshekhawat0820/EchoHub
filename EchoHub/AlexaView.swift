//
//  AlexaView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI

struct AlexaView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView()
                .padding(.horizontal, 15)
                .padding(.bottom)
                .background(Color.white)
            Spacer()
            Text("Hello, Alexa!")
        }
        .navigationBarBackButtonHidden(true)
    }
}

