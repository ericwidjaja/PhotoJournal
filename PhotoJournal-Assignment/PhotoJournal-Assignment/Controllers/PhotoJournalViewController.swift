//
//  PhotoJournalViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    
    
    //MARK: - Property
    var photos = [PhotoJournal]() {
        didSet {
            PhotoJournalViewController.reloadData()
        }
    }
    
    //MARK: - OUtlets:
    
    @IBOutlet weak var photoJournalCollectionView: UICollectionView!
    

    
    
}
