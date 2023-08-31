//
//  ContentView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            TodayView()
                .tabItem{
                    Label("Today", systemImage: "calendar")
                }
            WorkoutView2()
                .tabItem{
                    Label("Explore", systemImage: "dumbbell")
                }
            SummaryView()
                .tabItem{
                    Label("Summary", systemImage: "chart.xyaxis.line")
                }
            
            ChatView()
                .tabItem{
                    Label("Konsultasi", systemImage: "message")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static  var controller = MyController()
    static var previews: some View {
        ContentView().environmentObject(controller)
    }
}
