//
//  PasscodeIndicatorView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 3/19/24.
//

import SwiftUI

struct PasscodeIndicatorView: View {
    @Binding var passcode: String
    var body: some View {
        HStack(spacing: 32) {
            ForEach(0 ..< 4) { index in
                Circle()
                    .fill(passcode.count > index ? .white : primaryColor)
                    .frame(width: 20, height: 20)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 1.0)
                    }
            }
        }
    }
}

#Preview {
    PasscodeIndicatorView(passcode: .constant(""))
}
