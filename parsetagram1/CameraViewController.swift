//
//  CameraViewController.swift
//  parsetagram1
//
//  Created by Anastasiya Uraleva on 3/23/19.
//  Copyright © 2019 Anastasiya Uraleva. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse


class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        
        post["comment"] = commentField.text!
        post["author"] = PFUser.current()!
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!!")
            } else {
                print("not saved")
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        //present second screen before finishing up the photo editing
        
        let piker = UIImagePickerController()
        piker.delegate = self
        piker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            piker.sourceType = .camera
        } else {
            piker.sourceType = .photoLibrary
        }
        
        present(piker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaled_image = image.af_imageAspectScaled(toFill: size)
        imageView.image = scaled_image
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
