//
//  SetEmailViewModel.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 4/21/24.
//

import Foundation

class SetEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var emailErrorMessage: String = ""
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailTest.evaluate(with: email) {
            emailErrorMessage = ""
            return true
        } else {
            emailErrorMessage = "Invalid email format."
            return false
        }
    }
}
