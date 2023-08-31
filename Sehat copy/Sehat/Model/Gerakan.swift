//
//  Gerakan.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 13/08/23.
//

import Foundation
struct gerakaneModel : Identifiable{
    let id: Int
    let gerakanImage: String
    let gerakanName: String
    let gerakanTime: String
    
    init(id: Int, gerakanImage: String, gerakanName: String, gerakanTime: String) {
        self.id = id
        self.gerakanImage = gerakanImage
        self.gerakanName = gerakanName
        self.gerakanTime = gerakanTime
    }
    }


let work : [gerakaneModel] = [
gerakaneModel(id: 1, gerakanImage: "workout2", gerakanName: "Forearm Plank", gerakanTime: "00:20"),
gerakaneModel(id: 2, gerakanImage: "workout3", gerakanName: "Side Plank", gerakanTime: "00:30"),
gerakaneModel(id: 3, gerakanImage: "workout6", gerakanName: "Jumping Jacks", gerakanTime: "00:30"),
gerakaneModel(id: 4, gerakanImage: "workout3", gerakanName: "Forearm Plank", gerakanTime: "00:20"),

]

var planItems: [[Any]] = [

]

