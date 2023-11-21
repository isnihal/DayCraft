//
//  FocusScreenViewModel.swift
//  DayCraft
//
//  Created by Nihal Ismail on 11/21/23.
//

import SwiftUI

@Observable class FocusScreenViewModel{
    var updateTimeStamp = Date()
    var timer: Timer?
    
    init() {
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateTimeStamp = Date()
        }
    }
    
    deinit{
        timer?.invalidate()
        timer = nil
    }
}
