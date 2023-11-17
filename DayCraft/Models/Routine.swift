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
    let name: String
    let note: String
    let icon: String
    let time: Date
    let days: Set<Weekday>
    
    init(name: String, note: String, icon: String, time: Date, days: Set<Weekday>) {
        self.name = name
        self.note = note
        self.icon = icon
        self.time = time
        self.days = days
    }
    
    static let mockRoutine = Routine(name: "Golfing", note: "Swing a club, I'm great at golf", icon: "figure.golf", time: Date(), days: [])
}

enum Weekday: Int,Codable{
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}
