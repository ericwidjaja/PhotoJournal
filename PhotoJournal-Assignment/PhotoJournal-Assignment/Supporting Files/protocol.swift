//
//  protocol.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/7/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

protocol LoadDataDelegate: AnyObject {
    func loadData()
}

protocol PhotoDelegate: AnyObject{
    func passData(tag: Int)
 
}
protocol darkProtocol: AnyObject {
    func passDarkModeData(tag: Int)
}
