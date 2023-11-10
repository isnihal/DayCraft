//
//  DCCard.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct DCCard: View {
    var body: some View {
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
        .tint(Color(uiColor: .label))
        .frame(maxWidth: .infinity, maxHeight: 140)
        .background(.background)
        .clipShape(.buttonBorder)
        .shadow(color: .shadow,radius: 5)
    }
}

#Preview {
    DCCard()
}
