//
//  JournalCell.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/6/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class JournalCell: UICollectionViewCell {
    
    var buttonSelectedFunction: (()->())?
    
    
    //MARK: - Outlets & Action
    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var journalCaptionLabel: UILabel!
    @IBOutlet weak var journalOptionButton: UIButton!
    @IBOutlet weak var journalTimeStampLabel: UILabel!
    @IBAction func journalOptionButtonSelected(_ sender: UIButton) {
        if let closureButton = buttonSelectedFunction {
            closureButton()
        }
    }
}
