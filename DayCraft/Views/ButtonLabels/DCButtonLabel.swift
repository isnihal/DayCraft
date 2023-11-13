//
//  DCButtonLabel.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI

struct DCButtonLabel: View {
    let symbolName: String
    
    var body: some View {
        ZStack{
            Circle()
                .frame(height: 60)
                .foregroundStyle(Color(uiColor: .label))
            Image(systemName: symbolName)
                .imageScale(.large)
                .foregroundStyle(.background)
        }
    }
}

#Preview {
    DCButtonLabel(symbolName: "plus")
}
