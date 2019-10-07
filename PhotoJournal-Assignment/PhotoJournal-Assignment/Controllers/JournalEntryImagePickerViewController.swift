//
//  JournalEntryImagePickerViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit
import AVFoundation

class JournalEntryImagePickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var journalCaptionTextView: UITextView!
    @IBOutlet weak var journalPhoto: UIImageView!
    
    //MARK: - Properties
    weak var delegate: LoadDataDelegate?
    var savedPhoto: PhotoJournal!
    var savedImage: UIImage! {
        didSet {
            journalPhoto.image = savedImage}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCaptionTextView()
        //displayImage()
        
    }
   
    
    

    @IBAction func cancelButtonSelected(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var saveButtonSelected: UIBarButtonItem!
    
    
    @IBAction func photoLibraryAccess(_ sender: UIBarButtonItem) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(image, animated: true)
    }
    
    
    
    private func displayCaptionTextView() {
        journalCaptionTextView.text = "Enter photo description..."
        journalCaptionTextView.delegate = self
        formValidation()
    }
    private func formValidation() {
        if journalCaptionTextView.text != "Enter photo description..." , journalPhoto.image != UIImage(named: "noImage") {
            saveButtonSelected.isEnabled = true
        } else {
            saveButtonSelected.isEnabled = false
        }
    }
    
    
}
extension JournalEntryImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.originalImage] as? UIImage
//        savedImage = image
//        formValidation()
//        entryImage.backgroundColor = UIColor.clear
    self.dismiss(animated: true, completion: nil)
    }
}


extension JournalEntryImagePickerViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray && savedPhoto == nil {
        textView.text = nil
        textView.textColor = UIColor.black
        formValidation()
        }
    }
}
