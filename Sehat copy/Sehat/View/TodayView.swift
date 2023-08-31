//
//  TodayView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 10/08/23.
//

import SwiftUI
import Charts


struct TodayView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack{
                    VStack{
                        calendar()
                        hariIni()
                        Spacer()
                    }
                   
                }
                    .navigationBarTitle("Today's activities")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
            }
        }
        
        
        struct TodayView_Previews: PreviewProvider {
            @StateObject static  var controller = MyController()
            static var previews: some View {
                TodayView().environmentObject(controller)
            }
        }
        
        
        struct calendar: View{
            
            var body: some View{
                VStack(alignment:.leading){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 25){
                            
                            VStack(alignment:.center){
                                Text("01")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Sun")
                            }
                            VStack(alignment:.center){
                                Text("02")
                                    .font(.system(size: 14, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Mon")
                            }
                            .frame(width: 40, height: 90)
                            .background(Color.black)
                            .cornerRadius(100)
                            .foregroundColor(Color.white)
                            
                            VStack(alignment:.center){
                                Text("03")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Tue")
                            }
                            VStack(alignment:.center){
                                Text("04")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Wed")
                            }
                            
                            VStack(alignment:.center){
                                Text("05")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Thu")
                            }
                            VStack(alignment:.center){
                                Text("06")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Fri")
                            }
                            VStack(alignment:.center){
                                Text("07")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Sat")
                                
                            }
                            VStack(alignment:.center){
                                Text("08")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Fri")
                            }
                            VStack(alignment:.center){
                                Text("09")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.bottom, 0.3)
                                Text("Sat")
                                
                            }
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(Color.secondary)
                    .padding(.top, 20)
                }
                .padding(.leading, 20)
                Spacer()
            }
        }
        
        struct hariIni: View{
            
            @EnvironmentObject var controller:MyController
            
            var body: some View{

                    ZStack{
                        VStack{
                            Text("Your plan")
                                .frame(alignment: .leading)
                                .font(.system(size: 24))
                                .padding(.leading, -180)
                                .padding(.bottom, 10)
                            
                            ForEach(0..<planItems.endIndex, id:\.self) {item in
                                ZStack(alignment: .topLeading){
                                    Image(planItems[item][0] as! String)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 375, height: 150)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading){
                                        Text(planItems[item][1] as! String)
                                            .font(.system(size: 28, weight: .semibold))
                                        Text(planItems[item][2] as! String)
                                            .font(.system(size: 28, weight: .semibold))
                                        
                                        
                                        Button("View"){
                                            controller.isMainPage = true
                                        }
                                        
                                        .foregroundColor(.blue)
                                        .padding(.top, 1)
                                        .frame(width: 90, height: 25)
                                        .background(Color.white.opacity(0.5))
                                        .cornerRadius(100)
                                        .padding(.leading, 20)
                                        
                                    }
                                    .foregroundColor(Color.white)
                                    .padding(10)
                                    .padding(.leading, 10)
                                }
                                .padding(.top, 10)
                            }
                            
                        }
                        NavigationLink(destination: DetailWorkoutView(), isActive: $controller.isMainPage) {
                            EmptyView()
                        }
                    }
                    
                    .padding(.top, 30)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                
            }
        }
        
    }

