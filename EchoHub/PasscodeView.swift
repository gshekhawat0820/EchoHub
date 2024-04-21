//
//  PasscodeView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 3/19/24.
//

import SwiftUI
import SendGrid

struct PasscodeView: View {
    @State private var passcode = ""
    @Binding var isAdmin: Bool
    @Binding var passwordExists: Bool
    @Binding var emailExists: Bool
    @State private var showPassCodeError = false;
    @State private var shake = false;
    @State private var forgotPressed = false;
    @State private var number = "0000"
    @Environment(\.dismiss) private var dismiss;
    var resetEmail: Bool
    var resetPassword: Bool
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                if resetPassword {
                    if !forgotPressed {
                        Text("Please enter your current 4-digit pin to reset your password.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    else {
                        Text("Please enter the random 4-digit pin we just sent to \(KeychainManager.getEmail()!).")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
                else if resetEmail {
                    Text("Please enter your current 4-digit pin to reset your email from \(KeychainManager.getEmail() ?? "<empty>").")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.leading)
                        .padding(.trailing)
                }
                else {
                    Text("Please enter your 4-digit pin to access administrative mode.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
            }
            .padding(.top, 90)
            
            // indicator view
            
            PasscodeIndicatorView(passcode: $passcode)
            
            if showPassCodeError {
                Text("Incorrect password. Please try again.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.red)
                    .modifier(ShakeEffect(animatableData: shake ? 1 : 0))
                    .animation(.linear, value: shake)
            }
            
            if resetPassword && !forgotPressed {
                Button {
                    number = String(Int.random(in: 1000 ... 9999))
                    let session = Session()
                    session.authentication = Authentication.apiKey(sendGridAPIKey!)
                    let personalization = Personalization(recipients: KeychainManager.getEmail()!)
                    let plainText = Content(contentType: ContentType.plainText, value: "Your random 4-digit pin required to create a new passcode is: \(number).")
                    let email = Email(
                        personalizations: [personalization],
                        from: sendGridEmail,
                        content: [plainText],
                        subject: "Password Reset"
                    )
                    do {
                        try session.send(request: email)
                    } catch {
                        print(error)
                    }
                    forgotPressed = true;
                } label: {
                    Text("Forgot your Password?")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
            }
            
            Spacer()
            
            // numberpad view
            
            NumberPadView(passcode: $passcode)
                .padding(.bottom, 30)
        }
        .background(primaryColor)
        .onChange(of: passcode, { oldValue, newValue in 
            verifyPasscode()
        })
    }
    
    private func verifyPasscode() {
        guard passcode.count == 4 else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAdmin = passcode == KeychainManager.getPassword()
            showPassCodeError = forgotPressed ? passcode != number : passcode != KeychainManager.getPassword()
            if resetPassword {
                if forgotPressed {
                    if passcode == number {
                        KeychainManager.deletePassword()
                        passwordExists = false
                    }
                }
                else {
                    if passcode == KeychainManager.getPassword() {
                        KeychainManager.deletePassword()
                        passwordExists = false
                    }
                }
            }
            else {
                if passcode == KeychainManager.getPassword() {
                    if resetEmail {
                        KeychainManager.deleteEmail()
                        emailExists = false
                        KeychainManager.deletePassword()
                        passwordExists = false
                    }
                    else {
                        dismiss()
                    }
                }
            }
            passcode = ""
            shake.toggle()
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    
    func modifier(_ x: CGFloat) -> CGFloat {
        10 * sin(x * .pi * 2)
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let transform = ProjectionTransform(CGAffineTransform(translationX: 10 + modifier(animatableData), y: 0))
        
        return transform
    }
}

#Preview {
    PasscodeView(isAdmin: .constant(false), passwordExists: .constant(false), emailExists: .constant(true), resetEmail: true, resetPassword: false)
}
