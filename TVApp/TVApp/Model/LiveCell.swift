//
//  Cell.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/25.
//

import Foundation

struct LiveCell: Codable {
    let displayTitle: String
    let channel: Channel
    let live: Live
}
