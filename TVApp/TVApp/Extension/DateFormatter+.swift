//
//  DateFormatter+.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/26.
//

import Foundation

extension DateFormatter {
    convenience init (format: String) {
        self.init()
        dateFormat = format
        locale = Locale.current
    }
}

