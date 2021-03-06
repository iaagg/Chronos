//
//  SaturnWard.swift
//  Pods
//
//  Created by Alexey Getman on 22/10/2016.
//
//

import UIKit

class SaturnWard: NSObject {
    
    var saveNotificationPushTimer: Timer?
    var saveTimerPeriod: Double = 60*2.5 //Every 2.5 minutes for default

    class func ward() -> SaturnWard {
        struct Static {
            static let instance = SaturnWard()
        }
        
        return Static.instance
    }
    
    func startSavingSchedule(withInterval interval: Double?) {
        if let unwrappedInterval = interval {
            saveTimerPeriod = unwrappedInterval
        }
        
        if let timer = self.saveNotificationPushTimer {
            timer.invalidate()
        }
        
        self.saveNotificationPushTimer = Timer.scheduledTimer(timeInterval: saveTimerPeriod, target: SaturnKeeper.keeper(), selector: #selector(SaturnKeeper.saveAtomicTime), userInfo: nil, repeats: true)
    }
    
    deinit {
        if let timer = self.saveNotificationPushTimer {
            timer.invalidate()
        }
    }
    
}
