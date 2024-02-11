//
//  GoogleView.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI

struct GoogleView: View {
    @Environment(\.modelContext) private var modelContext;

    @State private var showPicker = false;
    @State private var sourceType = UIImagePickerController.SourceType.camera;
    @State private var image: UIImage? = nil;
    
    @State private var prompt = "";
    @State private var category: String = "Household";
    @State private var device: String = "Amazon Alexa";
    @State private var hidden: Bool = false;
    @State private var favorite: Bool = false;

    let devices = ["Amazon Alexa", "Google Home"];
    let categories = ["Household", "Entertainment", "Communication", "Routines", "Information & Chores"];
    
    func addAction() {
        guard let image = self.image else {
            return;
        }

        let action = Action(
            prompt: self.prompt,
            category: self.category,
            device: self.device,
            hidden: self.hidden,
            favorite: self.favorite,
            image: image
        );

        modelContext.insert(action)
    }

    var body: some View {
        Form {

            TextField("Prompt", text: $prompt)
            
            if (image == nil) {
                EmptyView()
            } else {
                Image(uiImage: image!).resizable()
                    .scaledToFit()
            }
            
            Menu("Set icon") {
                Button(
                    action: {
                        self.sourceType = UIImagePickerController.SourceType.camera;
                        self.showPicker.toggle();
                    },
                    label: {
                        Label(
                            "Camera",
                            systemImage: "camera"
                        )
                    }
                )
                Button(
                    action: {
                        self.sourceType = UIImagePickerController.SourceType.photoLibrary;
                        self.showPicker.toggle();
                    },
                    label: {
                        Label(
                            "Photo library",
                            systemImage: "photo.stack"
                        )
                    }
                )
            }
            .environment(\.menuOrder, .fixed)
            
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }

            Picker("Device", selection: $device) {
                ForEach(devices, id: \.self) {
                    Text($0)
                }
            }

            Toggle(isOn: $hidden) {
                Text("Hide")
            }

            Toggle(isOn: $favorite) {
                Text("Favorite")
            }
            
            Section {
                Button(action: addAction) {
                    Text("Submit")
                }
            }
        }
        .navigationTitle("Add Action")
        .fullScreenCover(isPresented: self.$showPicker, content: {
            ImagePickerView(
                showPicker: self.$showPicker,
                image: self.$image,
                sourceType: self.$sourceType
            );
        })
    }
}

#Preview {
    GoogleView()
}
