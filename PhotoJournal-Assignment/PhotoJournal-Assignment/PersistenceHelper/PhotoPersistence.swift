//
//  PhotoPersistence.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/7/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation

struct PhotoPersistenceHelper {
    static let manager = PhotoPersistenceHelper()
    
    func save(newPhoto: PhotoJournal) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhoto() throws -> [PhotoJournal] {
        return try persistenceHelper.getObjects()
    }
    
    func deletePhoto(withID: Int) throws {
        do {
            let photos = try getPhoto()
            let newPhotos = photos.filter { $0.id != withID}
            try persistenceHelper.replace(elements: newPhotos)
        }
    }
    
    func editPhoto(withID: Int, newPhoto: PhotoJournal) throws {
        do {
            let photos = try getPhoto()
            guard let indexOfOldPhoto = photos.firstIndex(where: {$0.id == withID}) else {return}
            try persistenceHelper.saveAtSpecificIndex(newElement: newPhoto, index: indexOfOldPhoto)
            try deletePhoto(withID: withID)
        }
    }
    
    private let persistenceHelper = PersistenceHelper<PhotoJournal>(fileName: "photos.plist")
    
    private init() {}
}
