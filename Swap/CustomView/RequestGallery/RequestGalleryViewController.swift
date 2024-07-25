//
//  RequestGalleryViewController.swift
//  WallpaperCreator
//
//  Created by İbrahim Taşdemir on 6.12.2023.
//

import UIKit
import PhotosUI



final class RequestGalleryViewController: UIViewController, AlertPresentable {
    
    protocol Delegate: AnyObject {
        func didFinishSelectImage(with images: [UIImage])
    }
    
    weak var delegate: RequestGalleryViewController.Delegate?
    
    private var imageArray: [UIImage] = []
    private var selectedImageCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestGallery()
    }
    
    init(){
        super.init(nibName: "RequestGalleryViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func requestGallery() {
        let pickLibrary = UIAlertAction(title: "Library", style: .default) { [weak self] _ in
            
            guard let self = self else {
                return
            }
            
            
            var config = PHPickerConfiguration()
            config.selectionLimit = 25
            
            
            let libraryImagePicker = PHPickerViewController(configuration: config)
            libraryImagePicker.delegate = self
            self.present(libraryImagePicker, animated: true)
            
        }
        
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            
            guard let self = self else {
                return
            }
            
            let cameraImagePicker = UIImagePickerController()
            cameraImagePicker.sourceType = .camera
            cameraImagePicker.delegate = self
            self.present(cameraImagePicker, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        showAlert(title: "Pick a Photo", message: "Choose a picture from Library or camera", style: .actionSheet, actions: [
            pickLibrary, cameraAction, cancelAction
        ])
    }
    
    private func appendImage(_ image: UIImage) {
        self.imageArray.append(image)
        if (imageArray.count == selectedImageCount) {
            DispatchQueue.main.async {
                self.delegate?.didFinishSelectImage(with: self.imageArray)
                self.dismiss(animated: true)
            }
        }
    }
    
}


//MARK: -> - Select Image ---
extension RequestGalleryViewController: UIImagePickerControllerDelegate,
                                        UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        let itemProviders = results.map(\.itemProvider)
        selectedImageCount = itemProviders.count
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let image = image as? UIImage {
                        self?.appendImage(image)
                    }
                }
            }
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //let image = info[.originalImage] as! UIImage
        //delegate?.didFinishSelectImage(with: info[.originalImage] as! UIImage)
        imageArray.append(info[.originalImage] as! UIImage)
        dismiss(animated: true)
    }
    
    
}
