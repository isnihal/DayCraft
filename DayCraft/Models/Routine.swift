//
//  Routine.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/16/23.
//

import Foundation
import SwiftData

@Model
class Routine{
    var name: String
    var note: String
    var icon: String
    var time: Date
    var days: Set<Weekday>
    
    init(name: String = "", note: String = "", icon: String = "", time: Date = .now, days: Set<Weekday> = []) {
        self.name = name
        self.note = note
        self.icon = icon
        self.time = time
        self.days = days
    }
}
