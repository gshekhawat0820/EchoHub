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
                Image(systemName: "arrow.left").foregroundColor(.white)
            })
            Spacer().frame(width: 70)
            Text("Echo")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image(systemName: "homepodmini.2.fill").foregroundColor(.white)
            Text("Hub")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer().frame(width: 60)
            NavigationStack {
                NavigationLink(destination: {
                    ActionView(action: nil)
                }, label: {
                    Text("+")
                        .font(.system(size: 40))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                })
            }
        }
        .background(primaryColor)
    }
}

#Preview {
    NavigationBarView()
        .previewLayout(.sizeThatFits)
        .padding()
}
