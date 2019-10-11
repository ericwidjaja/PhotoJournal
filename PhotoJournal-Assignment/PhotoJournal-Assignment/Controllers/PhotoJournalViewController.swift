//
//  PhotoJournalViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    
    //MARK: - Properties
    private var photos = [PhotoJournal]() {
        didSet {
            DispatchQueue.main.async {
                self.photoJournalCollectionView.reloadData()
            }
        }
    }
    private var scrollDirection = Int()
    private var darkModeId = Int()
    
    //MARK: - OUtlets:
    
    @IBOutlet weak var photoJournalCollectionView: UICollectionView!
    
    @IBAction func pushToJournalEntryVC(_ sender: UIBarButtonItem) {
    
    let storyboard = UIStoryboard(name: "Main", bundle:nil)
    let AddJournalEntryVC = storyboard.instantiateViewController(withIdentifier: "addJournalEntryVC") as! JournalEntryImagePickerViewController
        
        AddJournalEntryVC.delegate = self
        self.present(AddJournalEntryVC, animated: true, completion: nil)
    }
    @IBAction func settingButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let settingVC = storyBoard.instantiateViewController(identifier: "settingsVC") as! SettingsViewController
        settingVC.delegate = self
        settingVC.darkDelegate = self
        settingVC.darkModeInt = darkModeId
        settingVC.selectedScroll = scrollDirection
        settingVC.modalPresentationStyle = .currentContext
        self.present(settingVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoJournalCollectionView.dataSource = self
        for photo in photos {
            print("Name: \(photos.description), ID:\(photo.id)")
        }
   }

    func presentsActionSheet(id: Int, photo: PhotoJournal){
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            self.deletePhoto(with: id)
        })
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(deleteAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func deletePhoto(with id: Int) {
        do {
            try PhotoPersistenceHelper.manager.deletePhoto(withID: id)
        } catch {}
        do {
            self.photos = try PhotoPersistenceHelper.manager.getPhoto()
        } catch {}
    }
    override func viewWillAppear(_ animated: Bool) {
      loadData()
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
        
        cell.buttonSelectedFunction = {
            self.presentsActionSheet(id: photo.id, photo: photo)
        }
        return cell
    }
}
extension PhotoJournalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 460)
    }
}
extension PhotoJournalViewController: LoadDataDelegate {
    func loadData() {
        do {
            photos = try PhotoPersistenceHelper.manager.getPhoto()
        } catch {
            print(error)
        }
    }
}
extension PhotoJournalViewController: PhotoDelegate{
    func passData(tag: Int) {
        print(tag)
        scrollDirection = tag
        if let layout = photoJournalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            if tag == 0 {
                layout.scrollDirection = .vertical
            }else { layout.scrollDirection = .horizontal
            }
        }
        photoJournalCollectionView.reloadData()
    }
}
extension PhotoJournalViewController: darkProtocol{
    func passDarkModeData(tag: Int) {
        darkModeId = tag
        if tag == 0{
            view.backgroundColor = .lightGray
        }else {
            view.backgroundColor = .black
        }
    }
    
}

