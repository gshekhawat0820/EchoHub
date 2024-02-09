//
//  ImagePicker.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI

// References
// https://www.youtube.com/watch?v=W60nnRFUGaI
// https://www.youtube.com/watch?v=Y-65T0YBOm4

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var shown: Bool;
    @Binding var image: Image?;
    
    init(shown: Binding<Bool>, image: Binding<Image?>) {
        _shown = shown;
        _image = image;
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = Image(uiImage: uiImage);
            shown = false;
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        shown = false;
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var shown: Bool;
    @Binding var image: Image?;
    @Binding var sourceType: UIImagePickerController.SourceType;

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(shown: $shown, image: $image);
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController();
        picker.sourceType = self.sourceType;
        picker.delegate = context.coordinator;
        picker.allowsEditing = true;
        return picker;
    }
}
