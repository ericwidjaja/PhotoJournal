//
//  PhotoJournalViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    
    //MARK: - IBOUtlets:
    
    @IBOutlet weak var photoJournalCollectionView: UICollectionView!
  
    @IBOutlet weak var noEntryView: UIView!
    
    private var photoJournals = [PhotoJournal]() {
        didSet {
            photoJournalCollectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

