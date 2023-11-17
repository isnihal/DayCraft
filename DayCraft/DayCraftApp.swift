//
//  DayCraftApp.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/10/23.
//

import SwiftUI
import SwiftData

@main
struct DayCraftApp: App {
    var body: some Scene {
        WindowGroup {
            FocusScreen()
                .modelContainer(for: Routine.self)
        }
    }
}
