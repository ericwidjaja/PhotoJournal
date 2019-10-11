//
//  UserDefaultWrapper.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/10/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation

class UserDefaultWrapper {
    static let manager = UserDefaultWrapper()

    func store(mode: Int) {
        UserDefaults.standard.set(mode, forKey: modeKey)
    }
    func getDarkMode() -> Int? {
        return UserDefaults.standard.value(forKey: modeKey) as? Int
    }
    private init() {}
    private let modeKey = "mode"
}
