//
//  PhotoJournal.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/6/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    let lastUpdated: String
    let caption: String
    let imageData: Data
}

