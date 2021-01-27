//
//  MainCollectionViewPresent.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/27.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

class MainCollectionViewPresent {
    
    func getCreateTime(_ createTime: String) -> String {
    
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let startTime = format.date(from: createTime) else { return "?" }
        guard let endTime = format.date(from: format.string(from: Date())) else { return "?" }
        
        let timeDifference = Int(endTime.timeIntervalSince(startTime))
        
        if timeDifference <= 60 {
            return "•\(timeDifference)초 전"
        }
        else if timeDifference <= 60*60 {
            return "•\(timeDifference/60)분 전"
        }
        else if timeDifference <= 60*60*24 {
            return "•\(timeDifference/(60*60))시간 전"
        }
        else {
            return "•\(timeDifference/(60*60*24))일 전"
        }
    
    }
    
    func getDuration(_ duration: Int) -> String {
        
        let hour: Int = duration / 3600
        let minute: Int = (duration - hour * 3600) / 60
        let second: Int = duration % 60
        
        if hour >= 100 {
            return "\(hour):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
        }
        else if hour > 0 {
            return "\(String(format: "%02d", hour)):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
        }
        else {
            return "\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
        }
        
    }
    
}

