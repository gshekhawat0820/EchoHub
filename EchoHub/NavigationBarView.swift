//
//  NavigationBarView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI

struct NavigationBarView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>;
    @State private var showingSheet = false;
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
            Button {
                showingSheet.toggle();
            } label: {
                Text("+")
                    .font(.system(size: 40))
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
        }
        .background(primaryColor)
        .sheet(isPresented: $showingSheet) {
            ActionView(action: nil)
        }
    }
}

#Preview {
    NavigationBarView()
        .previewLayout(.sizeThatFits)
        .padding()
}
