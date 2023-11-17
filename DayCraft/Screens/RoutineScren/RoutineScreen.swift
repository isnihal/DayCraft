//
//  RoutineScreen.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct RoutineScreen: View {
    @State var isShowingSheet = false
    
    var body: some View {
        NavigationStack{
            VStack(){
                RoutineHeaderView(isShowingSheet: $isShowingSheet)
                .padding()
                Spacer().frame(height: 32)
                List{
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    TimeLineView()
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
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
