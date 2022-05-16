//
//  ImagePickerReprsentable.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePickerRepresentable : UIViewControllerRepresentable{
    @Environment(\.presentationMode) var isPres
    let image : (UIImage?)-> Void
   
    init(image : @escaping (UIImage?)->Void){
        self.image = image
    }
    
    func dismiss(){
        isPres.wrappedValue.dismiss()
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(image: image, dismiss: dismiss)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
               picker.sourceType = .camera
              picker.allowsEditing = false
              picker.delegate = context.coordinator
               return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        print("Mise à jour phtos")
    }
    

    
}


class ImagePickerCoordinator : NSObject ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let dismiss : () -> Void
    let image : (UIImage?) -> Void
    
    
    init(image : @escaping (UIImage?) -> Void , dismiss : @escaping () -> Void) {
        self.image = image
        self.dismiss = dismiss
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let new = info[.originalImage] as? UIImage {
            self.image(new)
        }
        self.dismiss()
        
        
    }
    
}
