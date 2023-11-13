//
//  ContentView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct FocusScreen: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                FocusView()
                    .offset(CGSize(width: 0, height: -20))
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
    var body: some View {
        VStack(spacing:0){
            ZStack{
                Circle()
                Image(systemName: "shower.handheld.fill")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .foregroundStyle(.background)
            }
            .padding(.horizontal,16)
            .padding(.bottom,16)
            Text("Wake Up")
                .font(.system(size: 42))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom,2)
            Text("27 Mins  |  Until 8:45")
                .font(.system(size: 24))
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
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
