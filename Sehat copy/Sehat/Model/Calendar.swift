//
//  Calendar.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 10/08/23.
//

import Foundation

struct calendarModel : Identifiable{
    let id: Int
    let tanggal: Int
    let hari: String
    
    init(id: Int, tanggal: Int, hari: String) {
        self.id = id
        self.tanggal = tanggal
        self.hari = hari
    }
}
