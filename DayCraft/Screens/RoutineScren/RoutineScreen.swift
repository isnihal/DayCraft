//
//  RoutineScreen.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI
import SwiftData

struct RoutineScreen: View {
    @State var isShowingSheet = false
    @Environment(\.modelContext) var context
    @Query(sort: \Routine.time) var routines: [Routine]
    
    var body: some View {
        NavigationStack{
            VStack(){
                RoutineHeaderView(isShowingSheet: $isShowingSheet)
                .padding()
                Spacer().frame(height: 32)
                List{
                    ForEach(routines) { routine in
                        TimeLineView(routine: routine)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            context.delete(routines[index])
                        }
                    })
                }
                .padding(.leading)
                .listStyle(.plain)
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
            .sheet(isPresented: $isShowingSheet, content: {
                CreateRoutineSheet(isShowingSheet: $isShowingSheet,time: .now, name: "", note: "",icon: "figure.boxing")
            })
        }
    }
}

#Preview {
    RoutineScreen()
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
