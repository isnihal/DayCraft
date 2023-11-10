//
//  RoutineScreen.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct RoutineScreen: View {
    var body: some View {
        NavigationStack{
            VStack(){
                HStack{
                    Text("Your\nRoutines")
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                    Spacer()
                    Button(action: {}, label: {
                        ZStack{
                            Circle()
                                .frame(width: 60,height: 60)
                                .foregroundStyle(Color(uiColor: .label))
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundStyle(.background)
                        }
                    })
                }
                Spacer()
                    .frame(height: 32)
                VStack {
                    HStack(){
                        ZStack{
                            Circle()
                                .foregroundStyle(.black)
                                .frame(height: 100)
                            Image(systemName: "figure.outdoor.cycle")
                                .scaleEffect(2.5)
                                .foregroundStyle(.white)
                        }
                        VStack(alignment: .leading){
                            Text("Cycling")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top,2)
                            Text("Cycle through the hills. I am great at cycling")
                                .font(.system(size: 16))
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                            Spacer()
                        }
                        .padding(.leading,4)
                        Spacer()
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 140)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    RoutineScreen()
}
