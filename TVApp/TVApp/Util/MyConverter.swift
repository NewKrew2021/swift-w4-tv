//
//  MyConverter.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/27.
//

import Foundation

class MyConverter {
    
    static func convertDuration(duration : Int) -> String{
        let H = duration/3600
        let M = duration%3600/60
        let S = duration%60
        let strH = String(H)
        let strM = M >= 10 ? String(M) : "0\(String(M))"
        let strS = S >= 10 ? String(S) : "0\(String(S))"
        if H > 0 {
            return "\(strH):\(strM):\(strS)"
        } else {
            return "\(strM):\(strS)"
        }
    }
    
    static func convertChannelCreateTime(channelCreateTime : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let frdate : Date = dateFormatter.date(from: channelCreateTime)!
        let todate = Date(timeIntervalSinceNow: 32400)
        let diff = Int(frdate.distance(to: todate))
        
        // 60 3600 86400
        switch diff {
        case 0...60:
            return "• \(diff)초 전"
        case 60...3600:
            return "• \(diff/60)분 전"
        case 3600...86400:
            return "• \(diff/3600)시간 전"
        default:
            return "• \(diff/86400)일 전"
        }
    }
    
    static func convertChannelVisitCountToString(channelVisitCount : Int) -> String {
        var resultString = ""
        var count = channelVisitCount
        while count > 0 {
            let num = count % 1000
            count /= 1000
            var tempstr = String(num)
            if resultString.count == 0 {
                if count == 0 {
                    resultString = tempstr
                }
                else {
                    while tempstr.count < 3 {
                        tempstr = "0\(tempstr)"
                    }
                    resultString = tempstr
                }
            } else {
                if count == 0 {
                    resultString = "\(tempstr),\(resultString)"
                }
                else {
                    while tempstr.count < 3 {
                        tempstr = "0\(tempstr)"
                    }
                    resultString = "\(tempstr),\(resultString)"
                }
            }
        }
        return "▶︎ \(resultString)"
    }
}
