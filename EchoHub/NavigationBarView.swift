//
//  NavigationBarView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/7/24.
//

import SwiftUI

struct NavigationBarView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>;
    @Binding var isAdmin: Bool;
    @State private var showingSheet = false;
    @State private var showPasscode = false;

    let assistantName: String;
    let isHomeAssistant: Bool;
    var body: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                Image(systemName: "arrow.left").foregroundColor(.white).font(.system(size:20))
            })
            Spacer().frame(width: 90)
            Text("Echo")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image(systemName: "homepodmini.2.fill").foregroundColor(.white)
            Text("Hub")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer().frame(width: 50)
            Button {
                if isAdmin {
                    isAdmin = false
                }
                else {
                    showPasscode.toggle()
                }
            } label: {
                Image(systemName: !isAdmin ? "lock" : "lock.open")
                    .foregroundColor(.white).font(.system(size: 20))
            }
            Spacer().frame(width: 20)
            
            if isAdmin {
                Button {
                    showingSheet.toggle();
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                }
            }
        }
        .background(primaryColor)
        .sheet(isPresented: $showingSheet) {
            ActionView(action: nil, assistantName: self.assistantName, isHomeAssistant: self.isHomeAssistant)
        }
        .sheet(isPresented: $showPasscode) {
            PasscodeView(isAdmin: $isAdmin)
        }
    }
}

//#Preview {
//    NavigationBarView(isAdmin: .constant(false), assistantName: "Amazon Alexa")
//        .previewLayout(.sizeThatFits)
//        .padding()
//}
