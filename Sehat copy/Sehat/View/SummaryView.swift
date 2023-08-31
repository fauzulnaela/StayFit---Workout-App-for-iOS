//
//  SummaryView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 10/08/23.
//

import SwiftUI
import Charts

struct SummaryView: View {
    
    @State var selectedTab = "Weekly"
    var tabs = ["Weekly", "Monthly"]
    
    var chartData = ["Weekly" :
        [SavingsDataPoint(day: "Sun", value: 30),
        SavingsDataPoint(day: "Mon", value: 15),
        SavingsDataPoint(day: "Tue", value: 20),
        SavingsDataPoint(day: "Wed", value: 5),
        SavingsDataPoint(day: "Thu", value: 10),
        SavingsDataPoint(day: "Fri", value: 12),
        SavingsDataPoint(day: "Sat", value: 45)],
        
                     "Monthly" :
        [SavingsDataPoint(day: "Jan", value: 230),
        SavingsDataPoint(day: "Feb", value: 215),
        SavingsDataPoint(day: "Mar", value: 220),
        SavingsDataPoint(day: "Apr", value: 325),
        SavingsDataPoint(day: "May", value: 110),
        SavingsDataPoint(day: "Jun", value: 412),
        SavingsDataPoint(day: "Jul", value: 615),
        SavingsDataPoint(day: "Aug", value: 425),
        SavingsDataPoint(day: "Sep", value: 545),
        SavingsDataPoint(day: "Oct", value: 345),
        SavingsDataPoint(day: "Nov", value: 845),
        SavingsDataPoint(day: "Dec", value: 245)
        ]
                     ]

                     
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    VStack{
                        Picker("breakdown", selection: $selectedTab){
                            ForEach(tabs, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(10)
                        
                        Statistik(data: chartData[selectedTab]!)
                            .frame(minHeight: 200)
                            .padding(16)
                            .animation(.easeInOut, value: selectedTab)
                           
                    }
                    .frame(width: 365, height: 300)
                    .cornerRadius(20)
                    .background(Color.white)
                    .padding(20)
                    
                    Progress()

                }
            }
            .navigationTitle("Summary")
            .background(.ultraThinMaterial)
        }
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

struct Statistik: View {
    let data: [SavingsDataPoint]
    
    var body: some View{
        Chart{
            ForEach(Array(data.enumerated()), id: \.offset) { index, element in
                BarMark(x: .value("Day", element.day), y: .value("Minutes", element.value))
//                    .foregroundStyle(Color("CobaWarna"))
//                    .foregroundStyle(index % 2 == 0 ? Color.darkBar: Color.lightBar)
                    .foregroundStyle(index % 2 == 0 ? .black: Color("CobaWarna"))
            }
        }
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading, values: .automatic) { value in
                AxisValueLabel() { // construct Text here
                    if let intValue = value.as(Int.self) {
                        if intValue == 0 {
                            Text("\(intValue)")
                                .font(.body)
                        } else if intValue <= 60 {
                            Text("\(intValue) m")
                                .font(.body)
                        } else if intValue > 60 {
                            Text("\(intValue / 60) h")
                                .font(.body)
                        }
                    }
                }
            }
        }
        
    }
}

struct Progress: View{
    var body: some View{
        
        VStack{
            HStack{
                HStack{
                    ZStack {
                        Circle()
                            .stroke(
                                Color.pink.opacity(0.2),
                                lineWidth: 6)
                            .frame(width: 50, height: 50)
                        Circle()
                            .trim(from: 0, to: 0.65) // 1
                            .stroke(
                                Color.pink,
                                lineWidth: 6)
                            .frame(width: 50, height: 50)
                    }
                    .padding(.trailing, 10)
                    VStack(alignment: .leading){
                        Text("3h 10m")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Total time")
                            .foregroundColor(.secondary)
                        
                        
                    }
                }
                Spacer()
                HStack{
                    ZStack {
                        Circle()
                            .stroke(
                                Color.pink.opacity(0.2),
                                lineWidth: 6)
                            .frame(width: 50, height: 50)
                        Circle()
                            .trim(from: 0, to: 0.35) // 1
                            .stroke(
                                Color.pink,
                                lineWidth: 6)
                            .frame(width: 50, height: 50)
                    }
                    .padding(.trailing, 10)
                    
                    VStack(alignment: .leading){
                        Text("1500 cal")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Burned")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 40)
            
            ZStack(alignment: .leading){
                Capsule().fill(Color.secondary.opacity(0.2)).frame(width:250, height: 10)
                Capsule().fill(Color.pink).frame(width: 100, height: 10)
            }
            .padding(.top, 45)
            
            HStack{
                Text("2 of 5")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Workouts Done")
                    .font(.title3)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
        }
        .frame(width: 365, height: 240)
        .background(Color.white)
        .cornerRadius(8)
    }
}



