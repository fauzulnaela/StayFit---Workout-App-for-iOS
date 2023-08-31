//
//  FinishView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 14/08/23.
//

import SwiftUI

struct FinishView: View {
    
    var body: some View {
        VStack{
            workoutFinished()
            myButton()
            Spacer()
        }
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}

struct workoutFinished: View{
    var body: some View{
        
        VStack(alignment:.leading){
            ZStack(alignment: .leading){
                Image("finish")
                    .resizable()
                    .frame(width: 365, height: 210)
                VStack{
                    Text("WORKOUT FINISHED")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                        .offset(y:60)
                    HStack{
                        Text("20 Days Keep Fit Challenge")
                        Circle()
                            .frame(width: 8, height: 8)
                        Text("Day 1")
                    }
                    .offset(y:47)
                    .offset(x:20)
                    .foregroundColor(Color.white)
                }
                
               
                
            }
            
                HStack(spacing:60){
                    VStack{
                        Text("6")
                            .font(.system(size: 22, weight: .bold))
                        Text("Exercise")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    VStack{
                        Text("154")
                            .font(.system(size: 22, weight: .bold))
                        Text("Calories")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    VStack{
                        Text("36:09")
                            .font(.system(size: 22, weight: .bold))
                        Text("Time")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .frame(width: 365, height: 100)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.top, 10)
        }
        
    }
}

struct myButton: View{
    @EnvironmentObject var controller:MyController
    var body: some View{
        Button (action: {controller.isMainPage = false}) {
            
            HStack (alignment: .center){
                Text("FINISH")
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.leading, 100)
                    .padding(.trailing, 100)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
            }
            
            .background(Color.black)
            .cornerRadius(100)
            .padding(.top, 30)
            
//            Button("Balik ke content"){
//                controller.isMainPage = false
//            }
        }
    }
    
}
