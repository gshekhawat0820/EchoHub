//
//  SetPasswordView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 3/21/24.
//

import SwiftUI

struct SetPasswordView: View {
    @State private var passcode = ""
    @Binding var passwordExists: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                primaryColor.ignoresSafeArea()
                VStack(spacing: 48) {
                    Text("Welcome to EchoHub")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 40))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    Image(systemName: "homepodmini.2.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 115, height: 100)
                    Text("Please select a password: ")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 25))
                        .fontWeight(.light)
                    
                    PasscodeIndicatorView(passcode: $passcode)
                    
                    // numberpad view
                    
                    NumberPadView(passcode: $passcode)
                        .padding(.bottom, 30)
                }
                .background(primaryColor)
                .onChange(of: passcode, { oldValue, newValue in
                    verifySetPassword()
                })
            }
        }
    }
    
    private func verifySetPassword() {
        guard passcode.count == 4 else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            KeychainManager.savePassword(password: passcode)
            passcode = ""
            passwordExists = true
        }
    }
}

#Preview {
    SetPasswordView(passwordExists: .constant(false))
}
