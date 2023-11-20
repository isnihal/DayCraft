//
//  ContentView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI
import SwiftData

struct FocusScreen: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                FocusView()
                Spacer()
                RoutineButtonLink()
            }
            .padding()
        }
        .accentColor(Color(uiColor: .label))
    }
}

#Preview {
    FocusScreen()
}

private struct FocusView: View {
    @Query(sort: \Routine.time) var routines: [Routine]

    
    var body: some View {
        if let currentRoutine = routines.focusRoutine.currentRoutine{
            VStack(spacing:0){
                ZStack{
                    Circle()
                    Image(systemName: currentRoutine.icon)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .foregroundStyle(.background)
                }
                .padding(.horizontal,16)
                .padding(.bottom,16)
                Text(currentRoutine.name)
                    .font(.system(size: 42))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom,2)
                if let nextRoutine = routines.focusRoutine.nextRoutine{
                    Text(nextRoutine.nextRoutineTime)
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
            }
            .offset(CGSize(width: 0, height: -20))
        } else{
            ContentUnavailableView("No Routines Added", systemImage: "tray", description: Text("Add your routines by tapping the button below"))
        }
    }
}

private struct RoutineButtonLink: View {
    var body: some View {
        HStack{
            Spacer()
            NavigationLink {
                RoutineScreen()
            } label: {
                DCButtonLabel(symbolName: "list.bullet")
            }
        }
    }
}
