//
//  DetailWorkoutView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 13/08/23.
//

import SwiftUI

struct DetailWorkoutView: View {
    var body: some View {
        ScrollView{
            VStack{
                hariIni()
                
                ForEach(work) { row in
                    VStack(spacing: 50){
                        gerakan(data: row)
                    }
                }
                
                Button (action: {print()}) {
                    NavigationLink(destination: StartWorkoutView()){
                        HStack (alignment: .center){
                            Text("Start Workout")
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.leading, 100)
                                .padding(.trailing, 100)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                        }
                    }
                    .background(Color.black)
                    .cornerRadius(100)
                    .padding(.top, 30)
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView()
    }
}

struct hariIni: View{
    var body: some View{
        ZStack{
            VStack{
                ZStack(alignment: .topLeading){
                    Image("collection5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 150)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading){
                        Text("20 Days")
                            .font(.system(size: 28, weight: .semibold))
                        Text("Keep Fit Challenge")
                            .font(.system(size: 28, weight: .semibold))
                        
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.white.opacity(0.4)).frame(width:150, height: 10)
                            Capsule().fill(Color.blue).frame(width: 20, height: 10)
                        }
                        .padding(.top, 14)
                        
                    }
                    .foregroundColor(Color.white)
                    .padding(10)
                    .padding(.leading, 10)
                }
                .padding(.top, 10)
                
            }
        }
        .padding(.bottom,30)
        
    }
}


struct gerakan: View{
    
    let data: gerakaneModel
    
    var body: some View{
        VStack (alignment:.leading){
            HStack{
                Image(self.data.gerakanImage)
                    .resizable()
                    .frame(width: 70, height: 80)
                    .background(Color.gray.opacity(0.07))
                    .cornerRadius(8)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    Text(self.data.gerakanName)
                        .font(.system(size: 20, weight: .bold))
                    Text(self.data.gerakanTime)
                        .padding(.top, 1)
                        .foregroundColor(Color.secondary) 
                }
                .padding(.leading, 20)
                Spacer()
                
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
        }
    }
}
