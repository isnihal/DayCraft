//
//  CreateRoutineSheet.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct CreateRoutineSheet: View {
    @Binding var isShowingSheet: Bool
    
    @State var time: Date
    @State var name: String
    @State var note: String
    @State var icon: String
    
    var body: some View {
        VStack{
            ActionButtonsView(isShowingSheet: $isShowingSheet, name: $name, note: $note, time: $time, icon: $icon)
            RoutineDetailsView(
                routineName: $name, routineNotes: $note, selectedIcon: $icon)
            Spacer().frame(height: 16)
            RoutineTimePickerView(time: $time)
            Spacer().frame(height: 16)
            IconContainerView(selectedIcon: $icon)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CreateRoutineSheet(isShowingSheet: .constant(true),time: .distantFuture, name: "",note: "", icon: "figure.boxing")
}

private struct ActionButtonsView: View {
    @Environment(\.modelContext) var context
    
    @Binding var isShowingSheet: Bool
    @Binding var name: String
    @Binding var note: String
    @Binding var time: Date
    @Binding var icon: String
    
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
                //MARK: - Create Routine Function
                let routine = Routine(name: name, note: note, icon: icon, time: time.normalizedDate, days: [.sunday,.monday,.tuesday,.wednesday,.thursday,.friday,.saturday])
                context.insert(routine)
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
    
    @Binding var time: Date
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color(uiColor: .label).opacity(0.05))
                .cornerRadius(8)
                .frame(height: 60)
            DatePicker("When", selection: $time, displayedComponents: .hourAndMinute)
                .fontWeight(.bold)
                .padding(.horizontal,16)
        }
    }
}
