//
//  programLive.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

struct ProgramLiveElement: Codable {
    let channel: liveChannel
    let live: Live

    enum CodingKeys: String, CodingKey {
        case channel, live
    }
}

struct liveChannel: Codable {
 
    let name: String
    let visitCount: Int
    let createTime: String

    enum CodingKeys: String, CodingKey {
        case name, visitCount, createTime
    }
}

struct Live: Codable {
    
    let title: String
    let playCount: Int
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case title, playCount, thumbnailURL = "thumbnailUrl"
    }
}

typealias ProgramLive = [ProgramLiveElement]


