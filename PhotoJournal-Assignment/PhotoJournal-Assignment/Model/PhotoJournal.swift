//
//  PhotoJournal.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/6/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    let id: Int
    let caption: String
    let imageData: Data
    let timeStamp: String
    
    static func getIDForNewPhoto() -> Int {
         do {
             let photos = try PhotoPersistenceHelper.manager.getPhoto()
             let max = photos.map{$0.id}.max() ?? 0
             return max + 1
         } catch {
             print(error)
         }
        return 0
     }
    static func getCurrentTime() -> String {
             
             let now = Date()
             
             let formatter = DateFormatter()
             
             formatter.timeZone = TimeZone.current
             
             formatter.dateFormat = "MMM d, yyyy h:mm a"
             
             return formatter.string(from: now)
         }
         
         init(id: Int, caption: String, ImageData: Data) {
             self.id = id
             self.caption = caption
             self.ImageData = image
             self.time = Photo.getCurrentTime()
         }
 }

