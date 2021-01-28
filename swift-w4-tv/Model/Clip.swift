//
//  Clip.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/27.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

struct Clip: Codable {
    let title: String
    let duration: Int
    let thumbnailURL: String
    let createTime: String
    let id: Int
    enum CodingKeys: String, CodingKey {
        case title, duration, thumbnailURL = "thumbnailUrl", createTime, id
    }
}
