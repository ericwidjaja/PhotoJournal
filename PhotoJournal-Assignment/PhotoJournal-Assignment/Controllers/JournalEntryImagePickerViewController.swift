//
//  JournalEntryImagePickerViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class JournalEntryImagePickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var journalCaptionTextView: UITextView!
    @IBOutlet weak var journalPhoto: UIImageView!
    
    //MARK: - Properties
    
    var photoJournal: PhotoJournal?
   
    
    

    @IBAction func cancelButtonSelected(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonSelected(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func cameraButtonSelected(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func photoLibraryaButtonSelected(_ sender: Any) {
    }
    
}
extension JournalEntryImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    }


extension JournalEntryImagePickerViewController: UITextViewDelegate {
    
    }

