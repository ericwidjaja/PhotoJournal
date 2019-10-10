//
//  SettingsViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/10/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    //MARK: - Properties
    var selectedScroll = Int()
    var darkModeInt = Int()
    weak var delegate: PhotoDelegate?
    weak var darkDelegate: darkProtocol?
    
    
    @IBOutlet weak var darkModeOn: UISegmentedControl!
    
    @IBOutlet weak var scrollHorizontalOff: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
