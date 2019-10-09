//
//  PhotoJournal.swift
//  PhotoJournal-Assignment
//
//  Created by Eric Widjaja on 10/6/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {

    let caption: String
    let imageData: Data
    let timeStamp: String
    var id: Int
    
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
    static func getTime() -> String {
         
         let currentDate = Date()
         let formatter = DateFormatter()
         
         formatter.dateFormat = "MMM d, yyyy h:mm a"

         return formatter.string(from: currentDate)
     }
     init(id: Int, caption: String, imageData: Data) {
         self.id = id
         self.caption = caption
         self.imageData = imageData
        self.timeStamp = PhotoJournal.getTime()
     }
 }

