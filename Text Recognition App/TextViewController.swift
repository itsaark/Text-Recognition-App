//
//  TextViewController.swift
//  Text Recognition App
//
//  Created by Arjun Kodur on 11/4/16.
//  Copyright © 2016 Arjun Kodur. All rights reserved.
//

import UIKit
import TesseractOCR

class TextViewController: UIViewController,G8TesseractDelegate {
    
    var inputImage = UIImage()

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseractObject = G8Tesseract(language: "eng") {
            tesseractObject.delegate = self
            tesseractObject.image = inputImage.g8_blackAndWhite()
            tesseractObject.recognize()
            
            textView.text = tesseractObject.recognizedText
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
