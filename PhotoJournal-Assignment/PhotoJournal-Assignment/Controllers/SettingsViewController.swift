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
    
    //MARK: -IBOutlets
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var darkModeOn: UISegmentedControl!
    
    @IBOutlet weak var scrollOrientationLabel: UILabel!
    @IBOutlet weak var scrollHorizontalOff: UISegmentedControl!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            loadUsersDefaultMode()
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        darkModeOn.selectedSegmentIndex = darkModeInt
        scrollHorizontalOff.selectedSegmentIndex = selectedScroll
        changeBackGround()
    }
    private func loadUsersDefaultMode(){
        if let mode = UserDefaultWrapper.manager.getDarkMode(){
           changeBackGround()
            darkModeOn.selectedSegmentIndex = mode
           }
       }
    func darkMode(){
        view.backgroundColor = .black
        darkModeLabel.textColor = .white
        scrollOrientationLabel.textColor = .white
        settingsLabel.textColor = .white
    }
    
    func grayMode(){
        view.backgroundColor = .lightGray
        darkModeLabel.textColor = .black
        scrollOrientationLabel.textColor = .black
        settingsLabel.textColor = .blue
    }
    
    @IBAction func darkModeSegment(_ sender: UISegmentedControl) {
        darkDelegate?.passDarkModeData(tag: sender.selectedSegmentIndex)
            darkModeInt = sender.selectedSegmentIndex
        UserDefaultWrapper.manager.store(mode: darkModeInt)
        changeBackGround()
    }

    func changeBackGround() {
        if darkModeInt == 0 {
            grayMode()
        } else {darkMode()}
    }

    @IBAction func scrollButton(_ sender: UISegmentedControl) {
        delegate?.passData(tag: sender.selectedSegmentIndex)
    }
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
