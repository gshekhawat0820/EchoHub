//
//  PasscodeView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 3/19/24.
//

import SwiftUI

struct PasscodeView: View {
    @State private var passcode = ""
    @Binding var isAdmin: Bool
    @State private var showPassCodeError = false;
    @State private var shake = false;
    @Environment(\.dismiss) private var dismiss;
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                Text("Please enter your 4-digit pin to access administrative mode.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
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
            showPassCodeError = !isAdmin
            passcode = ""
            if isAdmin {
                dismiss()
            }
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
    PasscodeView(isAdmin: .constant(false))
}
