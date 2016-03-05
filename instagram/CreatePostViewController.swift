//
//  CreatePostViewController.swift
//  instagram
//
//  Created by Fernando Rodríguez on 3/4/16.
//  Copyright © 2016 Fernando Rodríguez. All rights reserved.
//

import UIKit
import Parse

class CreatePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var captionField: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    var image: UIImage = UIImage()
    
    @IBAction func onTakePicture(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func onChoosePhoto(sender: AnyObject){
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        captionField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    
        //self.presentViewController(imagePicker, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            image = editedImage
            selectedImage.image = image
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onPost(sender: AnyObject) {
       Post.postUserImage(image, withCaption: captionField.text, withCompletion: nil)
        print("succesfully posted")
        
    }
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func textViewDidChange(textView: UITextView) {
        let count = textView.text.characters.count
        if count != 0 {
            textLabel.hidden = true
        }else {
            textLabel.hidden = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
