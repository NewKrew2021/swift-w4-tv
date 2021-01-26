//
//  Int+.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/26.
//

import Foundation

extension Int {
    static func getNumWithCommaFormat(number: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}
