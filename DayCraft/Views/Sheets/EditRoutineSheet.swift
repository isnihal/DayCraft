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
            ActionButtonsView(routine: routine)
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
    @Bindable var routine: Routine
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        HStack{
            Button(action: {
                #warning("Confirm routine delettion")
                context.delete(routine)
                dismiss()
            }, label: {
                Text("Delete")
                    .foregroundStyle(.red)
            })
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
    @FocusState private var focusState: TextFocusState?
    
    var body: some View {
        HStack(alignment: .top){
            ZStack{
                Circle()
                    .frame(height: 100)
                Image(systemName: routine.icon)
                    .aspectRatio(contentMode: .fit)
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
                    .focused($focusState, equals: .name)
                    .onSubmit {
                        focusState = .note
                    }
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
                    .focused($focusState, equals: .note)
                    .onSubmit {
                        focusState = nil
                    }
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
