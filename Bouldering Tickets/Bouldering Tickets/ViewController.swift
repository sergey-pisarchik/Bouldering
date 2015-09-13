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
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:"onKeyBoard:",
            name:UIKeyboardWillShowNotification,
        object:nil);
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:"onKeyBoardHide:",
            name:UIKeyboardWillHideNotification,
            object:nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: observers
    
    @objc func onKeyBoard(notification: NSNotification){
        firstName.text = "111"
        
        let userInfo = notification.userInfo
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                
                let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                firstName.text = keyboardSize.height.description
                
                self.bottomConstraint.constant = keyboardSize.height
            }
        }
    }
    
    @objc func onKeyBoardHide(notification: NSNotification){
        self.bottomConstraint.constant = 0
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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var saveButton: UIBarButtonItem!


    var user: UserInfo?
    
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
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            
        
            var fn = firstName.text
            var sn = secondName.text
            var fa = fathersName.text
            var ph = Phone.text
            var ml = mail.text
            var es = enterSource.text
            var ds = discount.text
            var nt = note.text
            var im = photo.image

            user = UserInfo(firstName: fn, secondName: sn, fathersName: fa, phone: ph, mail: ml, enterSource: es, discount: ds, note: nt, photo: im)
            
          

            
        }
        
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

