//
//  SehatApp.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 04/08/23.
//

import SwiftUI

@main
struct SehatApp: App {
    @StateObject var controller = MyController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(controller)
        }
    }
}
