//
//  ContentView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI
import SwiftData

struct FocusScreen: View {
    @Query(sort: \Routine.time) var routines: [Routine]
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                FocusView(routines: routines)
                Spacer()
                RoutineButtonLink(routines: routines)
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
    
    var routines: [Routine]
    var viewModel = FocusScreenViewModel()
    
    var body: some View {
        if let currentRoutine = routines.focusRoutine.currentRoutine{
            VStack(spacing:0){
                ZStack{
                    Circle()
                    Text(viewModel.updateTimeStamp.description)
                        .foregroundStyle(.clear)
                    Image(systemName: currentRoutine.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundStyle(.background)
                }
                .padding(.horizontal,16)
                .padding(.bottom,16)
                Text(currentRoutine.name)
                    .font(.system(size: 42))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.bottom,2)
                if let nextRoutine = routines.focusRoutine.nextRoutine{
                    Text(nextRoutine.nextRoutineTime)
                        .lineLimit(2)
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
    var routines: [Routine]
    
    var body: some View {
        HStack{
            Spacer()
            NavigationLink {
                if !routines.isEmpty{
                    RoutineScreen()
                }
                else{
                    AddRoutineSheet(isShowingSheet: .constant(false),showAsSheet: false)
                }
            } label: {
                DCButtonLabel(symbolName: routines.isEmpty ? "plus":"list.bullet")
            }
        }
    }
}
