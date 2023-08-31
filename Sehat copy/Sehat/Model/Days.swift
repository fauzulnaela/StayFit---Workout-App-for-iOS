//
//  Days.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 13/08/23.
//

import Foundation

struct days : Identifiable{
    let id: Int
    let day: String
    
    init(id: Int, day: String) {
        self.id = id
        self.day = day
    }
}

let hari : [days] = [
    days(id: 1, day: "Sun"),
    days(id: 2, day: "Mon"),
    days(id: 3, day: "Tue"),
    days(id: 4, day: "Wed")

    ]

let hari2 : [days] = [
    days(id: 5, day: "Thu"),
    days(id: 6, day: "Fri"),
    days(id: 7, day: "Sat"),
]
