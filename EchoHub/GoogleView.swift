//
//  GoogleView.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI

struct GoogleView: View {
    @State private var showPicker = false;
    @State private var image: Image? = nil;
    @State private var sourceType = UIImagePickerController.SourceType.camera;

    var body: some View {
        VStack {

            image?.resizable()
                .scaledToFit()

            Menu("Set image") {
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
        }
        .sheet(isPresented: self.$showPicker, content: {
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
