//
//  GoogleView.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI
import SwiftData

struct ActionView: View {
    @Environment(\.modelContext) private var modelContext;
    
    let action: Action?

    @State private var showPicker = false;
    @State private var sourceType = UIImagePickerController.SourceType.camera;
    @State private var image: UIImage? = nil;
    
    @State private var name = "";
    @State private var prompt =  "";
    @State private var category: String = "Household";
    @State private var device: String = "Amazon Alexa";
    @State private var hidden: Bool = false;
    @State private var favorite: Bool = false;

    let devices = ["Amazon Alexa", "Google Home"];
    let categories = ["Household", "Entertainment", "Communication", "Routines", "Information & Chores"];
    
    init(action: Action?) {
        guard let action = action else {
            self.action = nil;
            return;
        }
        
        self.name = action.name;
        self.prompt = action.prompt;
        self.category = action.category;
        self.device = "Amazon Alexa";
        self.hidden = false;
        self.favorite = false;
        
        guard action.imageData != nil else {
            self.action = action;
            return;
        }

        self.image = UIImage(data: action.imageData!);
        self.action = action;
    }

    func addAction() {
        guard let image = self.image else {
            return;
        }

        if let action {
            action.name = self.name;
            action.prompt = self.prompt;
            action.category = self.category;
            action.device = self.device;
            action.hidden = self.hidden;
            action.favorite = self.favorite;
            action.imageData = image.pngData();
        } else {
            let action = Action(
                name: self.name,
                prompt: self.prompt,
                category: self.category,
                device: self.device,
                hidden: self.hidden,
                favorite: self.favorite,
                image: image
            );

            modelContext.insert(action)
        }
    }

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $name);
            }
            
            Section(header: Text("Prompt")) {
                TextField("Prompt", text: $prompt, axis: .vertical)
            }

            if (image == nil) {
                EmptyView()
            } else {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 75, height: 75, alignment: .center)
                    .clipShape(.buttonBorder)
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
        .navigationTitle(action == nil ? "Add Action" : "Edit Action")
        .fullScreenCover(isPresented: self.$showPicker, content: {
            ImagePickerView(
                showPicker: self.$showPicker,
                image: self.$image,
                sourceType: self.$sourceType
            );
        })
    }
}

//#Preview {
//    GoogleView()
//}
