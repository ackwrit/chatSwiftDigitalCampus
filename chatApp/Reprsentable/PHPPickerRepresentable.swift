//
//  PHPPickerRepresentable.swift
//  chatApp
//
//  Created by Djino Dissingar on 25/04/2022.
//

import Foundation
import UIKit
import SwiftUI
import PhotosUI

struct PHPPickerRepresentable : UIViewControllerRepresentable{
    
    let image : (UIImage?) -> Void
    @Environment(\.presentationMode) var isPres
    
    
    
    init(image : @escaping (UIImage?) -> Void){
        self.image = image
    }
    
    func dismiss(){
        isPres.wrappedValue.dismiss()
    }
    
    func makeCoordinator() -> PHPCoordinator {
        PHPCoordinator(image: image, dismiss: dismiss)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var conf = PHPickerConfiguration()
        conf.selectionLimit = 1
        conf.filter = .images
        let picker = PHPickerViewController(configuration: conf)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("Mise à jour")
    }
    
    
    
}

class PHPCoordinator : NSObject, PHPickerViewControllerDelegate {
    let dismiss : () -> Void
    let image : (UIImage?) -> Void
    
    
    init(image : @escaping (UIImage?) -> Void , dismiss : @escaping ()-> Void ) {
        self.image = image
        self.dismiss = dismiss
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for r in results {
            let item = r.itemProvider
            if(item.canLoadObject(ofClass: UIImage.self)){
                item.loadObject(ofClass: UIImage.self) { image , error in
                    DispatchQueue.main.async {
                        if let img = image as? UIImage {
                            self.image(img)
                        }
                    }
                }
            }
        }
        self.dismiss()
    }
    
   
    
    

    

    
    
    

    
}
