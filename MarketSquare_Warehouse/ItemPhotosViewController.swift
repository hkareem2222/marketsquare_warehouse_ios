//
//  ItemPhotosViewController.swift
//  MarketSquare_Warehouse
//
//  Created by Husein Kareem on 3/22/17.
//  Copyright © 2017 MarketSquare. All rights reserved.
//

import UIKit

class ItemPhotosViewController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    
    static func fromStoryboard() -> ItemPhotosViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemPhotosViewController") as? ItemPhotosViewController
        return controller!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAddButton()
    }

    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addButtonPressed))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addButtonPressed() {
        self.showCameraActionSheet()
        
    }
    
    private func showCameraActionSheet() {
        let alert = UIAlertController(title: "Add a Photo", message: "", preferredStyle: .actionSheet)
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default, handler: {
            _ in
            
            self.takePhoto()
        })
        alert.addAction(takePhoto)
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            _ in
            
            self.photoLibrary()
        })
        alert.addAction(photoLibrary)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    private func takePhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        picker.modalPresentationStyle = .fullScreen
        self.present(picker, animated: true)
    }
    
    private func photoLibrary() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.present(picker, animated: true)
    }
}

extension ItemPhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoIdentifier", for: indexPath)
        return cell
    }
}

extension ItemPhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension ItemPhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
