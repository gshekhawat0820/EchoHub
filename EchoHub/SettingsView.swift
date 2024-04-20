//
//  SettingsView.swift
//  EchoHub
//
//  Created by Eric Lau on 3/20/24.
//

import SwiftUI
import AWSPolly

struct SettingsView: View {
    @Binding var confirm: Bool;
    @State private var selectedLanguage: String = UserDefaults.standard.string(forKey: "language")!;
    @State private var selectedVoice: String = UserDefaults.standard.string(forKey: "voice")!;

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
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(confirm: .constant(true))
}
