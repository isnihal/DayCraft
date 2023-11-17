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
    let time: Date
    let days: Set<Weekday>
    
    init(name: String, note: String, time: Date, days: Set<Weekday>) {
        self.name = name
        self.note = note
        self.time = time
        self.days = days
    }
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
