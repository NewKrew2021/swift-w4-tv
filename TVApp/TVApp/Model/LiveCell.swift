//
//  Cell.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/25.
//

import Foundation

struct LiveCell: Codable {
    let liveId: Int
    let displayTitle, createTime: String
    let live: Live
}
