//
//  SetEmailView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 4/21/24.
//

import SwiftUI

struct SetEmailView: View {
    @Binding var emailExists: Bool
    @StateObject var viewModel = SetEmailViewModel()
    var body: some View {
        VStack(spacing: 30) {
            Text("Create an Account")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 20)
                .foregroundColor(primaryColor)
            
            VStack(alignment: .leading, spacing: 0) {
                TextField("Enter your email", text: $viewModel.email)
                    .padding()
                    .textInputAutocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .background(.white)
                    .cornerRadius(15)
                .shadow(radius: 1)
                if !viewModel.emailErrorMessage.isEmpty {
                    Text(viewModel.emailErrorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .padding(.leading, 5)
                        .padding(.top, 5)
                }
            }
            
            
            Button {
                if viewModel.isValidEmail() {
                    KeychainManager.saveEmail(email: viewModel.email)
                    emailExists = true
                }
            } label: {
                Text("Next")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .background(primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
        .padding()
    }
}

#Preview {
    SetEmailView(emailExists: .constant(false))
}
