//
//  EdItRoutineSheet.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct EdItRoutineSheet: View {
    @Bindable var routine: Routine
    
    var body: some View {
        VStack{
            ActionButtonsView()
            RoutineDetailsView(routine: routine)
            Spacer().frame(height: 16)
            RoutineTimePickerView(routine: routine)
            Spacer().frame(height: 16)
            IconContainerView(selectedIcon: $routine.icon)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EdItRoutineSheet(routine: Routine.mockRoutine)
}

private struct ActionButtonsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
            })
        }
        .padding(.top,16)
        .padding(.bottom,32)
    }
}

private struct RoutineDetailsView: View {
    @Bindable var routine: Routine
    
    var body: some View {
        HStack(alignment: .top){
            ZStack{
                Circle()
                    .frame(height: 100)
                Image(systemName: routine.icon)
                    .scaleEffect(2.5)
                    .foregroundStyle(.background)
            }
            Spacer().frame(width: 12)
            VStack{
                TextField("Routine Name", text: $routine.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Spacer().frame(height: 12)
                TextField("Notes", text: $routine.note)
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
    
    @Bindable var routine: Routine
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color(uiColor: .label).opacity(0.05))
                .cornerRadius(8)
                .frame(height: 60)
            DatePicker("When", selection: $routine.time, displayedComponents: .hourAndMinute)
                .fontWeight(.bold)
                .padding(.horizontal,16)
        }
    }
}
