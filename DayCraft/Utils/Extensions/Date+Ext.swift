//
//  Date+Ext.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/17/23.
//

import Foundation

extension Date{
    var normalizedDate: Date{
        var dateComponents = DateComponents()
        //Uniform date: Launch of the first iPhone 
        dateComponents.year = 2007
        dateComponents.month = 1
        dateComponents.day = 9
        dateComponents.hour = Calendar.current.component(.hour, from: self)
        dateComponents.minute = Calendar.current.component(.minute, from: self)
        
        guard let customDate = Calendar.current.date(from: dateComponents) else {fatalError()}
        
        return customDate
    }
}
