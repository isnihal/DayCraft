//
//  Utils.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/17/23.
//

import Foundation

func formatTime(time: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm a"
    
    return dateFormatter.string(from: time)
}
