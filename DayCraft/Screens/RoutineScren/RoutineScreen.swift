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
                RoutineHeader()
                Spacer().frame(height: 32)
                DCCard()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    RoutineScreen()
}

struct RoutineHeader: View {
    var body: some View {
        HStack{
            Text("Your\nRoutines")
                .font(.system(size: 32))
                .fontWeight(.heavy)
            Spacer()
            Button(action: {}, label: {
                DCButtonLabel(symbolName: "plus")
            })
        }
    }
}
