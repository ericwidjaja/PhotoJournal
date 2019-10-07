//
//  JournalEntryImagePickerViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class JournalEntryImagePickerViewController: UIViewController {
    
    //MARK: - Setup IBOutlets
    @IBOutlet weak var journalCaptionTextView: UITextView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBOutlet weak var cancelButtonSelected: UIBarButtonItem!
    
    @IBOutlet weak var saveButtonSelected: UIBarButtonItem!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
