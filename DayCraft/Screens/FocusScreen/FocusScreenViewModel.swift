//
//  FocusScreenViewModel.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/21/23.
//

import SwiftUI

@Observable class FocusScreenViewModel{
    var updateTimeStamp = Date()
    private var initialTimer: Timer?
    private var minuteTimer: Timer?
    
    private var secondsFrom60: Int{
        60 - Calendar.current.component(.second, from: .now)
    }
    
    init() {
        startInitialTimer()
    }
    
    func startInitialTimer(){
        initialTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(secondsFrom60), repeats: false, block: { _ in
            self.updateTimeStamp = Date()
            self.startMinuteTimer()
        })
    }
    
    private func startMinuteTimer(){
        minuteTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateTimeStamp = Date()
        }
    }
    
    deinit{
        initialTimer?.invalidate()
        minuteTimer?.invalidate()
        minuteTimer = nil
        initialTimer = nil
    }
}
