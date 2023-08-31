//
//  StartWorkoutView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 14/08/23.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct StartWorkoutView: View {
    
    @State var counter: Int = 0
    var countTo: Int = 30
    
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment:.leading){
                    HStack(spacing: 15){
                        Capsule()
                            .foregroundColor(Color.black)
                            .frame(width: 80, height: 5)
                        Capsule()
                            .foregroundColor(Color.secondary.opacity(0.3))
                            .frame(width: 80, height: 5)
                        Capsule()
                            .foregroundColor(Color.secondary.opacity(0.3))
                            .frame(width: 80, height: 5)
                        Capsule()
                            .foregroundColor(Color.secondary.opacity(0.3))
                            .frame(width: 80, height: 5)
                    }
                    
                    Image("workout2")
                        .resizable()
                        .frame(width: 365, height: 365, alignment: .center)
                    
                    Text("Forearm Plank")
                        .font(.system(size: 26, weight: .bold))
                        .offset(y: -100)
                }
                
                ZStack{
                    Circle()
                        .fill(.clear)
                        .frame(width: 230, height: 230)
                        .overlay(
                            Circle().stroke(Color.gray.opacity(0.3), lineWidth: 20))
                    
                    Circle()
                        .fill(.clear)
                        .frame(width: 230, height: 230)
                        .overlay(
                            Circle().trim(from: 0, to: progress())
                                .stroke(style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round,
                                    lineJoin: .round)
                                )
                        )
                        .foregroundColor(
                            (completed() ? Color.blue : Color.black )
                        ).animation (
                            .easeInOut(duration: 0.2))
                    
                    Clock(counter: counter, countTo: countTo)
                    
                    
                    
                    
                }
                .offset(y:-80)
                .onReceive(timer) { time in
                    if(self.counter < self.countTo){
                        self.counter += 1
                    }
                    
                    
                }
                
                HStack{
                    Button (action: {print()}) {
                        NavigationLink(destination: WorkoutView2()){
                            HStack (alignment: .center){
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color.black)
                                    .frame(width: 70, height: 70)
                                
                            }
                            .padding()
                            .frame(width: 70, height: 70)
                        }
                        .cornerRadius(100)
                        .padding(.top, 10)
                        
                    }
                    
                    Button (action: {print()}) {
                        NavigationLink(destination: WorkoutView2()){
                            HStack (alignment: .center){
                                Image(systemName: "pause.fill")
                                    .foregroundColor(Color.white)
                                    .frame(width: 100, height: 100)
                                
                            }
                            .padding()
                            .frame(width: 70, height: 70)
                        }
                        .background(Color.black)
                        .cornerRadius(100)
                        .padding(.top, 10)
                        
                    }
                    
                    Button (action: {print()}) {
                        NavigationLink(destination: FinishView()){
                            HStack (alignment: .center){
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .frame(width: 100, height: 100)
                                
                            }
                            .padding()
                            .frame(width: 70, height: 70)
                        }
                        .cornerRadius(100)
                        .padding(.top, 10)
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 90)
                .offset(y:-80)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
            
        }
    }
    
    func completed() -> Bool{
        return progress() == 1
    }
    
    func progress() -> CGFloat{
        return (CGFloat(counter)/CGFloat(countTo))
    }
}

struct Clock : View {
    
    var counter : Int
    var countTo : Int
    
    var body: some View{
        VStack{
            Text(counterToMinutes())
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
    func counterToMinutes() -> String{
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes) : \(seconds < 10 ? "0" : "") \(seconds)"
    }
}



struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutView()
    }
}
