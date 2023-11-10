//
//  TimeLineView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct TimeLineView: View {
    var body: some View {
        HStack(alignment: .top){
            CircleLineView()
            VStack(alignment: .leading,spacing: 0){
                Text("08:00")
                    .font(.title)
                    .bold()
                    .padding(.leading,4)
                    .offset(CGSize(width: 0, height: -7))
                DCCard()
                    .padding(.trailing)
            }
        }
    }
}

struct CircleLineView: View {
    var body: some View {
        VStack(spacing: 0){
            Circle()
                .frame(height: 30)
            Rectangle()
                .frame(width: 2, height: 180)
        }
    }
}

#Preview {
    TimeLineView()
}
