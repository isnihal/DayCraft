//
//  Enums.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/17/23.
//

import Foundation
import SwiftUI

enum Weekday: Int,Codable{
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

enum TextFocusState{
    case name
    case note
}
