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
