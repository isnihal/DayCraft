//
//  CreateRoutineSheet.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct CreateRoutineSheet: View {
    
    @Binding var isShowingSheet: Bool
    
    @State var routineTime: Date
    @State var routineName: String
    @State var routineNotes: String
    @State var selectedIcon: String
    
    var body: some View {
        VStack{
            ActionButtonsView(isShowingSheet: $isShowingSheet)
            RoutineDetailsView(
                routineName: $routineName, routineNotes: $routineNotes, selectedIcon: $selectedIcon)
            Spacer().frame(height: 16)
            RoutineTimePickerView(date: $routineTime)
            Spacer().frame(height: 16)
            IconContainerView(selectedIcon: $selectedIcon)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CreateRoutineSheet(isShowingSheet: .constant(true),routineTime: .distantFuture, routineName: "",routineNotes: "", selectedIcon: "figure.boxing")
}

private struct ActionButtonsView: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        HStack{
            Button(action: {
#warning("Check if changes should be discarded")
                isShowingSheet = false
            }, label: {
                Text("Cancel")
            })
            Spacer()
            Button(action: {
#warning("Save routine here")
                isShowingSheet = false
            }, label: {
                Text("Done")
            })
        }
        .padding(.top,16)
        .padding(.bottom,32)
    }
}

private struct RoutineDetailsView: View {
    @Binding var routineName: String
    @Binding var routineNotes: String
    @Binding var selectedIcon: String
    
    var body: some View {
        HStack(alignment: .top){
            ZStack{
                Circle()
                    .frame(height: 100)
                Image(systemName: selectedIcon)
                    .scaleEffect(2.5)
                    .foregroundStyle(.background)
            }
            Spacer().frame(width: 12)
            VStack{
                TextField("Routine Name", text: $routineName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Spacer().frame(height: 12)
                TextField("Notes", text: $routineNotes)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 80, alignment: .top)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
    }
}

private struct RoutineTimePickerView: View {
    
    @Binding var date: Date
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color(uiColor: .label).opacity(0.1))
                .cornerRadius(8)
                .frame(height: 60)
            DatePicker("When", selection: $date, displayedComponents: .hourAndMinute)
                .fontWeight(.bold)
                .padding(.horizontal,16)
        }
    }
}
