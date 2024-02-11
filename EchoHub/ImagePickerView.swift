//
//  ImagePickerView.swift
//  EchoHub
//
//  Created by Eric Lau on 2/7/24.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var showPicker: Bool;
    @Binding var image: Image?;
    @Binding var sourceType: UIImagePickerController.SourceType;
    
    var body: some View {
        ImagePicker(
            shown: self.$showPicker,
            image: self.$image,
            sourceType: self.$sourceType
        );
    }
}

#Preview {
    ImagePickerView(
        showPicker: .constant(false),
        image: .constant(
            Image("")
        ),
        sourceType: .constant(
            UIImagePickerController.SourceType.camera
        )
    )
}
