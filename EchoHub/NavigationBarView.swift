//
//  NavigationBarView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI

struct NavigationBarView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                Image(systemName: "arrow.left")
            })
            Spacer()
            Text("Echo")
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.blue)
            Image(systemName: "homepodmini.2.fill").foregroundColor(.blue)
            Text("Hub")
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}

#Preview {
    NavigationBarView()
        .previewLayout(.sizeThatFits)
        .padding()
}
