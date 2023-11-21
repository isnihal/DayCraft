//
//  IconContainerView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/11/23.
//

import SwiftUI

struct IconContainerView: View {
    @Binding var selectedIcon: String
    let columnLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .top){
                Rectangle()
                    .foregroundStyle(Color(uiColor: .label).opacity(0.05))
                    .cornerRadius(8)
                IconGridView(selectedIcon: $selectedIcon, icons: K.icons, columnLayout: columnLayout)
            }
        }
    }
}

#Preview {
    IconContainerView(selectedIcon: .constant(K.icons.first!))
}

private struct IconGridView: View {
    @Binding var selectedIcon: String
    
    let icons: [String]
    let columnLayout: [GridItem]
    
    var body: some View {
        LazyVGrid(columns: columnLayout,spacing: 24,content: {
            ForEach(icons, id: \.self) { icon in
                IconItem(iconImage: icon, selectedIcon: $selectedIcon)
            }
        })
        .padding(.horizontal)
        .padding(.vertical,24)
    }
}

struct IconItem: View {
    var iconImage: String
    @Binding var selectedIcon: String
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 60)
                .foregroundStyle(Color(uiColor: .label).opacity(0.1))
            Image(systemName: iconImage)
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.75)
        }
        .onTapGesture {
            selectedIcon = iconImage
        }
        .overlay {
            if selectedIcon == iconImage{
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2))
            }
        }
    }
}
