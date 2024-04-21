//
//  SettingsView.swift
//  EchoHub
//
//  Created by Eric Lau on 3/20/24.
//

import SwiftUI
import AWSPolly

struct SettingsView: View {
    @Environment(\.openURL) var openURL
    var email = FeedbackEmail(toAddress: "echohubfeedback@gmail.com", subject: "Feedback Email", messageHeader: "Please leave any feedback/suggestions about EchoHub below:")
    @State private var selectedLanguage: String = UserDefaults.standard.string(forKey: "language")!;
    @State private var selectedVoice: String = UserDefaults.standard.string(forKey: "voice")!;
    @State private var showPasswordReset = false;
    @State private var showEmailReset = false;
    @Binding var passwordExists: Bool;
    @Binding var emailExists: Bool;
    @Binding var confirm: Bool;
    var body: some View {
        NavigationView {
            Form {
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(Array(polly.keys).sorted(by: <), id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
                .pickerStyle(.inline)
                .onChange(of: selectedLanguage) {
                    if let voices = polly[selectedLanguage] {
                        selectedVoice = Array(voices.keys)[0];
                        
                        UserDefaults.standard.setValue(selectedLanguage, forKey: "language");
                        UserDefaults.standard.setValue(selectedVoice, forKey: "voice");
                    }
                }
                if let voices = polly[$selectedLanguage.wrappedValue] {
                    Picker("Voice", selection: $selectedVoice) {
                        ForEach(Array(voices.keys).sorted(by: <), id: \.self) { voice in
                            Text(voice).tag(voice)
                        }
                    }
                    .pickerStyle(.inline)
                    .onChange(of: selectedVoice) {
                        if let voice = voices[selectedVoice] {
                            speaker.speak(
                                action: voice.prompt,
                                voice: (voice.id, voice.languageCode)
                            );
                            
                            UserDefaults.standard.setValue(selectedVoice, forKey: "voice");
                        }
                    }
                    .id(selectedLanguage)
                }

                Toggle("Confirmation Popup", isOn: $confirm)

                HStack {
                    Button(action: {
                        showEmailReset.toggle()
                    }, label: {
                        Text("Reset Email")
                    })
                }
                HStack {
                    Button(action: {
                        showPasswordReset.toggle()
                    }, label: {
                        Text("Reset Password")
                    })
                }
                HStack {
                    Button {
                        email.send(openURL: openURL)
                    } label: {
                        Text("Send Feedback!")
                    }
                }
            }.navigationTitle("Settings")
        }
        .sheet(isPresented: $showPasswordReset) {
            PasscodeView(isAdmin: .constant(false), passwordExists: $passwordExists, emailExists: $emailExists, resetEmail: false, resetPassword: true)
        }
        .sheet(isPresented: $showEmailReset) {
            PasscodeView(isAdmin: .constant(false), passwordExists: $passwordExists, emailExists: $emailExists, resetEmail: true, resetPassword: false)
        }
    }
}

#Preview {
    SettingsView(passwordExists: .constant(false), emailExists: .constant(true), confirm: .constant(true))
}
