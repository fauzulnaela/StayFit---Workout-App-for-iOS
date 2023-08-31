//
//  Exercise.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 05/08/23.
//

import Foundation

struct packageModel : Identifiable{
    let id: Int
    let packageImage: String
    let packageImage2: String
    let packageName1: String
    let packageName2: String
    let packageTime: Int
    let packageCal: Int

    
    init(id: Int, packageImage: String, packageImage2: String, packageName1: String, packageName2: String, packageTime: Int, packageCal: Int) {
        self.id = id
        self.packageImage = packageImage
        self.packageImage2 = packageImage2
        self.packageName1 = packageName1
        self.packageName2 = packageName2
        self.packageTime = packageTime
        self.packageCal = packageCal

    }
    }

let Data : [Any] = [
    packageModel(id: 1, packageImage: "collection4", packageImage2: "workout1", packageName1: "20 Days ", packageName2: "Keep Fit Challenge", packageTime: 30, packageCal: 540),
    packageModel(id: 2, packageImage: "collection2", packageImage2: "workout2", packageName1: "Immunity Booster", packageName2: "At Home", packageTime: 45, packageCal: 840),
    packageModel(id: 3, packageImage: "collection3", packageImage2: "workout3", packageName1: "7 Days", packageName2: "Calorie Burner", packageTime: 25, packageCal: 440),
    packageModel(id: 4, packageImage: "collection1", packageImage2: "workout4", packageName1: "30 Days", packageName2: "Full Body Challenge", packageTime: 15, packageCal: 140)
]


    

