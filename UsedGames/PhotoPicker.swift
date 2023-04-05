//
//  PhotoPicker.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 5.04.2023.
//

import UIKit
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable{
    
    @Binding var selectedPhoto: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> some UIViewController {
        
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = context.coordinator
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var photoPicker: PhotoPicker
         init(_ picker: PhotoPicker){
             self.photoPicker = picker
             super.init()
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let selectedPhoto = info[.editedImage] as?
                UIImage ?? info[.originalImage] as? UIImage {
                photoPicker.selectedPhoto = selectedPhoto
            }else{
                photoPicker.selectedPhoto = nil
            }
        }
    }
    
    
    
}
