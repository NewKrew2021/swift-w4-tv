//
//  String+.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/26.
//

import Foundation

extension String {
    func toDate (format: String) -> Date? {
        return DateFormatter(format: format).date(from: self)
    }
}


