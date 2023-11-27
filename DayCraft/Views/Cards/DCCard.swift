//
//  DCCard.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct DCCard: View {
    
    let routine: Routine
    
    var body: some View {
        VStack {
            HStack(){
                RoutineIconView(routine: routine)
                RoutineNameView(routine: routine)
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
    DCCard(routine: Routine.mockRoutine)
}

private struct RoutineIconView: View {
    let routine: Routine
    
    var body: some View {
        ZStack{
            Circle()
                .frame(height: 100)
            Image(systemName: routine.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundStyle(.background)
        }
    }
}

private struct RoutineNameView: View {
    let routine: Routine
    
    var body: some View {
        VStack(alignment: .leading){
            Text(routine.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top,2)
            Text(routine.note)
                .font(.system(size: 16))
                .lineLimit(2)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.leading,4)
    }
}
