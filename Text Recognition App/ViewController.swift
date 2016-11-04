//
//  ViewController.swift
//  Text Recognition App
//
//  Created by Arjun Kodur on 11/4/16.
//  Copyright © 2016 Arjun Kodur. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func pickImageButtonTapped(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if imageView.image == nil{
            errorLabel.text = "Please pick an image"
        }else{
            
            performSegue(withIdentifier: "JumpToTextVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TextViewController
        destinationVC.inputImage = imageView.image!
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = pickedImage
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        errorLabel.text = ""
        imagePicker.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

