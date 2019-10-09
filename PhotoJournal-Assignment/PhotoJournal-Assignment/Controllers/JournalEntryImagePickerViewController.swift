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
    weak var delegate: LoadDataDelegate?
    var savedPhoto: PhotoJournal!
    var savedImage: UIImage! {
        didSet {
            journalPhoto.image = savedImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCaptionTextView()
        journalCaptionTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if savedPhoto != nil {
            journalCaptionTextView.text = savedPhoto.caption
            let image = UIImage(data: savedPhoto.imageData)
            journalPhoto.image = image
        }
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
    
    
    @IBAction func takePhotoCameraButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func savePhotoButton(_ sender: UIBarButtonItem) {
        guard let text = journalCaptionTextView.text else {return}
        guard let image = journalPhoto.image else { return }
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        let photo = PhotoJournal(id: PhotoJournal.getIDForNewPhoto(),caption: text, imageData: data)
        do {
            if savedPhoto != nil {
                try PhotoPersistenceHelper.manager.editPhoto(withID: savedPhoto.id, newPhoto: photo)
                delegate?.loadData()
            } else {
                try PhotoPersistenceHelper.manager.savePhoto(newPhoto: photo)
                delegate?.loadData()}
        }catch{
            print(error)}
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func displayCaptionTextView() {
        journalCaptionTextView.text = "Enter photo description..."
        journalCaptionTextView.delegate = self

    }
    
    private func configureImage() {
        if journalPhoto.image == nil {
            journalPhoto.image = UIImage(named: "noImage")
        }
    }
}

extension JournalEntryImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.originalImage] as? UIImage
        savedImage = image
        journalPhoto.backgroundColor = UIColor.black
    self.dismiss(animated: true, completion: nil)
    }
}

extension JournalEntryImagePickerViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        textView.textColor = UIColor.black
        }
}
