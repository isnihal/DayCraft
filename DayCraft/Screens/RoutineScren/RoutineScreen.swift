//
//  RoutineScreen.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI
import SwiftData

struct RoutineScreen: View {
    @State var isShowingCreateRoutineSheet = false
    @State var selectedRoutine: Routine?
    
    var body: some View {
        NavigationStack{
            VStack(){
                RoutineHeaderView(isShowingSheet: $isShowingCreateRoutineSheet)
                .padding()
                Spacer().frame(height: 32)
                RoutineListView(selectedRoutine: $selectedRoutine)
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
            .sheet(isPresented: $isShowingCreateRoutineSheet, content: {
                AddRoutineSheet(isShowingSheet: $isShowingCreateRoutineSheet)
            })
            .sheet(item: $selectedRoutine, content: { routine in
                EdItRoutineSheet(routine: routine, routineName: routine.name)
            })
        }
    }
}

#Preview {
    RoutineScreen(selectedRoutine: Routine.mockRoutine)
}

private struct RoutineHeaderView: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        HStack{
            Text("Your\nRoutines")
                .font(.system(size: 32))
                .fontWeight(.heavy)
            Spacer()
            Button(action: {
                isShowingSheet = true
            }, label: {
                DCButtonLabel(symbolName: "plus")
            })
        }
    }
}

struct RoutineListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Routine.time) var routines: [Routine]
    @Binding var selectedRoutine: Routine?
    
    var body: some View {
        if !routines.isEmpty{
            List{
                ForEach(routines) { routine in
                    TimeLineView(routine: routine)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selectedRoutine = routine
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        context.delete(routines[index])
                    }
                })
            }
            .padding(.leading)
            .listStyle(.plain)
        }else{
            ContentUnavailableView("No Routines Added", systemImage: "tray", description: Text("Add your routines by tapping the button above"))
                .offset(CGSize(width: 0, height: -75.0))
        }
    }
}
