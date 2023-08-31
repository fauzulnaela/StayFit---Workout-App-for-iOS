//
//  WorkoutView2.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 13/08/23.
//

import SwiftUI

struct WorkoutView2: View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                ZStack{
                    VStack{
        
                        
                        Text("Workout Package")
                            .frame(alignment: .leading)
                            .font(.system(size: 20))
                            .padding(.leading, -185)
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
        
                        ForEach(Data) { row in
                            VStack(spacing: 10){
                                workoutPackage2(data: row)
                            }
                            .offset(y:-20)
                        }
                  
                    }
                    
                    
                }
                .navigationTitle("Workout Plan 💪 ")
            }
        }
        
    }
}

struct WorkoutView2_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView2()
    }
}



struct workoutPackage2: View{
    let data: packageModel
    
    var body: some View{
        NavigationLink(destination: DetailView(package: packageModel(id: self.data.id, packageImage: self.data.packageImage, packageImage2: self.data.packageImage2, packageName1: self.data.packageName1, packageName2: self.data.packageName2, packageTime: self.data.packageTime, packageCal: self.data.packageCal))){
        ZStack{
            VStack{
                //
                
                ZStack(alignment: .topLeading){
                    Image(self.data.packageImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 150)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading){
                        Text(self.data.packageName1)
                            .font(.system(size: 24, weight: .medium))
                        Text(self.data.packageName2)
                            .font(.system(size: 24, weight: .medium))
                        
                        
                        //                        Text("30 Exercise")
                        //                            .font(.system(size: 16))
                        //                            .padding(.top, 1)
                        HStack{
                            HStack{
                                Image(systemName: "alarm")
                                    .foregroundColor(Color.blue)
                                
                                Text("\(self.data.packageTime) min")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.black)
                            }
                            .frame(width: 90, height: 25)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(100)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                            
                            HStack{
                                Image(systemName: "flame")
                                    .foregroundColor(Color.orange)
                                
                                Text("\(self.data.packageCal) kcal")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.red)
                            }
                            .frame(width: 100, height: 25)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(100)
                            .padding(.leading, 20)
                            .padding(.top, 10)
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                }
            }
            
        }
        .padding(.top, 10)
    }
    }
}

