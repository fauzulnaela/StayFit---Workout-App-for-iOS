//
//  DetailView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 13/08/23.
//

import SwiftUI

struct DetailView: View {
    
    var package: packageModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                VStack(alignment: .leading){
                    Image(package.packageImage2)
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(package.packageName1 + " " + package.packageName2)
                        .font(.system(size: 26, weight: .bold))
                        .padding(.top, 50)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum risus ac diam imperdiet, eu sollicitudin nibh ullamcorper. ")
                        .foregroundColor(Color.secondary)
                        .padding(.top, 1)

                }
                .padding(.leading,20)
                .padding(.trailing,20)
                HStack{
                    VStack(alignment: .leading){
                        Text("Set up schedule")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top,70)
                            .padding(.leading,20)
                        HStack{
                            ForEach(hari) { row in
                                HStack(spacing: 0){
                                    setSchedule(dataHari: row)
                                }
                            }
                            Spacer()
                        }
                        
                        HStack{
                            ForEach(hari2) { row in
                                HStack(spacing: 2){
                                    setSchedule(dataHari: row)
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(width: 200, height: 300)
                }
                .frame(width: 360, height: 200)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.top, 30)
                
                
                
                Button (action: {planItems.append(package)}) {
                    VStack (alignment: .center){
                        Text("Add to plan")
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
                
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let paket = packageModel(id: 1, packageImage: "collection1", packageImage2: "workout1", packageName1: "30 days worokout", packageName2: "challenge", packageTime: 20, packageCal: 30)
        
        return
        
        NavigationView{
            DetailView(package: paket)
         
        }
    }
}

struct setSchedule: View{
    
    @State private var isTapped = false
    let dataHari : days
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                HStack{
                    if(!self.isTapped){
                        Text(self.dataHari.day)
                            .frame(width: 50, height: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .onTapGesture {
                                if(!self.isTapped){
                                    self.isTapped = true
                                } else{
                                    self.isTapped = false
                                }
                            }
                    }else{
                        Text(self.dataHari.day)
                            .frame(width: 50, height: 50)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(8)
                            .onTapGesture {
                                if(!self.isTapped){
                                    self.isTapped = true
                                } else{
                                    self.isTapped = false
                                }
                            }
                        
                    }
                    
                       
                        Spacer()
                    }
                }
                
            }
            .padding(.leading, 20)
            .padding(.top, 5)
        }
        
    }

