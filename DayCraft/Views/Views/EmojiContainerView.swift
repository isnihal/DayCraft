//
//  EmojiContainerView.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/11/23.
//

import SwiftUI

struct EmojiContainerView: View {
    @Binding var selectedIcon: String
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .foregroundStyle(Color(uiColor: .label).opacity(0.1))
                .cornerRadius(8)
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],spacing: 24,content: {
                IconItem(iconImage: "figure.boxing", selectedIcon: $selectedIcon)
                IconItem(iconImage: "circle.hexagongrid.circle.fill", selectedIcon: $selectedIcon)
                IconItem(iconImage: "sun.haze.fill", selectedIcon: $selectedIcon)
                IconItem(iconImage: "cloud.snow", selectedIcon: $selectedIcon)
                IconItem(iconImage: "cloud.rain", selectedIcon: $selectedIcon)
            })
            .padding(.horizontal)
            .padding(.vertical,24)
        }
    }
}

#Preview {
    EmojiContainerView(selectedIcon: .constant("figure.boxing"))
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
