//
//  Channel.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/27.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

struct Channel: Codable {
    let name: String
    let visitCount: Int
    let createTime: String

    enum CodingKeys: String, CodingKey {
        case name, visitCount, createTime
    }
}
