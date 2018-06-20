//
//  ViewController.swift
//  TextDetect
//
//  Created by Sayalee on 6/13/18.
//  Copyright © 2018 Assignment. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var detectedText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    lazy var vision = Vision.vision()
    var textDetector: VisionTextDetector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("couldn't load image")
        }
        imageView.image = image
        
        detectText(image: image)
    }
}

// MARK: - IBActions

extension ViewController {
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera)  else {
            let alert = UIAlertController(title: "No camera", message: "This device does not support camera.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func photosButtonTapped(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)  else {
            let alert = UIAlertController(title: "No photos", message: "This device does not support photos.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
}

// MARK: - Methods

extension ViewController {
    func detectText (image: UIImage) {
        
        textDetector = vision.textDetector()
        
        let visionImage = VisionImage(image: image)
        
        textDetector?.detect(in: visionImage) { (features, error) in
            guard error == nil, let features = features, !features.isEmpty else {
                return
            }
            
            debugPrint("Feature blocks in th image: \(features.count)")
            
            var detectedText = ""
            for feature in features {
                let value = feature.text
                detectedText.append("\(value) ")
            }
            
            debugPrint(detectedText)
            self.detectedText.text = detectedText
            
        }
    }
}


