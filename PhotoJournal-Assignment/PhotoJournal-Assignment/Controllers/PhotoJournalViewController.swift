//
//  PhotoJournalViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    
    //MARK: - OUtlets:
    
    @IBOutlet weak var photoJournalCollectionView: UICollectionView!
    //MARK: - Property
    var photos = [PhotoJournal]() {
        didSet {
            photoJournalCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        photoJournalCollectionView.dataSource = self
        //loadData()
    }

    @IBAction func pushToJournalEntryVC(_ sender: UIBarButtonItem) {
    
    let storyboard = UIStoryboard.init(name: "Main", bundle:nil)
    let AddJournalEntryVC = storyboard.instantiateViewController(withIdentifier: "addJournalEntryVC") as! JournalEntryImagePickerViewController
    
        AddJournalEntryVC.delegate = self
        self.present(AddJournalEntryVC, animated: true, completion: nil)
    }
}


extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        guard let cell = photoJournalCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? JournalCell else {
            return UICollectionViewCell()
        }
        
        let photo = photos[indexPath.row]
        cell.journalCaptionLabel.text = photo.caption
        cell.journalTimeStampLabel.text = photo.timeStamp
        let image = UIImage(data: photo.imageData)
        cell.journalImageView.image = image
        
//        cell.buttonSelectedFunction = {
//            self.displayActionSheet(id: )
//            self.displayActionSheet(id: photo.id, photo: photo)
//        }
        return cell
    }
    
}
extension PhotoJournalViewController : LoadDataDelegate {
    func loadData() {
        do {
            photos = try PhotoPersistenceHelper.manager.getPhoto()
        } catch {
            print(error)
        }
    }
}


