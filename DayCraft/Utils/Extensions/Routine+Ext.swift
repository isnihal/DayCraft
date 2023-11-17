//
//  Routine+Ext.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/17/23.
//

import Foundation

extension Routine{
    var formattedTime: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: time)
    }
    
    static let mockRoutine = Routine(name: "Golfing", note: "Swing a club, I'm great at golf", icon: "figure.golf", time: Date(), days: [])
}
