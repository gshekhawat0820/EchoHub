//
//  ImagePickerView.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var showPicker: Bool;
    @Binding var image: UIImage?;
    @Binding var sourceType: UIImagePickerController.SourceType;
    
    var body: some View {
        ZStack{
            ImagePicker(
                shown: self.$showPicker,
                image: self.$image,
                sourceType: self.$sourceType
            );
        }.ignoresSafeArea()
    }
}

#Preview {
    ImagePickerView(
        showPicker: .constant(false),
        image: .constant(
            UIImage()
        ),
        sourceType: .constant(
            UIImagePickerController.SourceType.camera
        )
    )
}
