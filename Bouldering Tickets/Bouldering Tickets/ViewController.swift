//
//  ViewController.swift
//  Bouldering Tickets
//
//  Created by Sergey Pisarchik on 9/12/15.
//  Copyright (c) 2015 Sergey Pisarchik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Properties
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var fathersName: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var enterSource: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var note: UITextView!


    // MARK: Actions
    @IBAction func takePicture(sender: UILongPressGestureRecognizer) {
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePickerController.sourceType = .Camera
        }
        else {
            imagePickerController.sourceType = .PhotoLibrary
        }
        // Only allow photos to be picked, not taken.
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func showPhoto(sender: UITapGestureRecognizer) {
        HideKeyboard()
        
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            // The info dictionary contains multiple representations of the image, and this uses the original.
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // Set photoImageView to display the selected image.
            photo.image = selectedImage
            
            // Dismiss the picker.
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: methods
    func HideKeyboard(){
        firstName.resignFirstResponder()
        secondName.resignFirstResponder()
        fathersName.resignFirstResponder()
        Phone.resignFirstResponder()
        mail.resignFirstResponder()
        enterSource.resignFirstResponder()
        discount.resignFirstResponder()
        note.resignFirstResponder()
        
    }
    
}

