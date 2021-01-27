//
//  Convert.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/27.
//

import Foundation

class Convert {
    static func getStringNumToCommaFormat(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    static func getDistFromCurrentTime(time: String) -> String {
        return ""
    }
}
