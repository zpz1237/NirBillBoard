//
//  ProfileViewController.swift
//  NirBillboard
//
//  Created by Nirvana on 7/11/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var buttonImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonImage.setImage(UIImage(named: "1430891193_photo-128"), forState: UIControlState.Normal)
        
        assert(buttonImage.imageView?.image != nil)
        // Do any additional setup after loading the view.
    }

    @IBAction func choosePhoto(sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            self.goCamera()
        }
        let archiveAction = UIAlertAction(title: "从相册选择", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            self.goImage()
            }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func goCamera() {
        
        var sourceType = UIImagePickerControllerSourceType.Camera
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = sourceType
        
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func goImage() {
        
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(picker.sourceType)!
        
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        buttonImage.setImage(image, forState: UIControlState.Normal)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
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
