//
//  ViewController.swift
//  HelloWorld
//
//  Created by Orange Autumn on 2018-06-29.
//  Copyright © 2018 Orange Autumn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //Mark: Properties
   
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealName: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.

        mealName.delegate = self
    
    }

    
    //MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        mealName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text;
    }
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage;
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil);
    }
    //MARK: Actions
    
    
    @IBAction func setDefaultText(_ sender: UIButton) {
        mealName.text = "Default Text"
    }
    
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
     /*   mealName.resignFirstResponder()
        let imageController = UIImagePickerController()
        
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        present(imageController, animated: true, completion: nil) */

    }
    
}

