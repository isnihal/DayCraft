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
    
    var nextRoutineTime: String{
        let currentDate = Date().normalizedDate
        let timeDifference = Int(self.time.timeIntervalSince(currentDate)/60)
        var timeDifferenceInMinutes = 0
        if timeDifference < 0{
            timeDifferenceInMinutes = 1440 + timeDifference
        }else{
            timeDifferenceInMinutes = timeDifference
        }
        return "\(timeDifferenceInMinutes) Mins | Until \(self.formattedTime)"
    }
}

extension [Routine]{
    var focusRoutine: (currentRoutine: Routine?, nextRoutine: Routine?){
        let currentTime = Date().normalizedDate
        var currentRoutine: Routine?
        var nextRoutine: Routine?
        
        if self.isEmpty{
            return (nil,nil)
        }
        if self.count == 1{
            currentRoutine = self.first!
        }
        else{
            for i in 0..<self.count-1{
                //Check if current time falls between 2 routine times
                if currentTime >= self[i].time &&
                    currentTime < self[i+1].time{
                    currentRoutine = self[i]
                    nextRoutine = self[i+1]
                }
            }
            //If no matches, only this case remains
            if currentRoutine == nil{
                currentRoutine = self.last!
                nextRoutine = self.first
            }
        }
        return (currentRoutine,nextRoutine)
    }
}
