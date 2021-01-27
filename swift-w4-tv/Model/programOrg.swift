//
//  programOrg.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.

import Foundation

struct ProgramOrgElement: Codable {
    let channel: Channel
    let clip: Clip

    enum CodingKeys: String, CodingKey {
        case channel, clip
    }
}

struct Channel: Codable {
    let name: String
    let visitCount: Int
    let createTime: String

    enum CodingKeys: String, CodingKey {
        case name, visitCount, createTime
    }
}

struct Clip: Codable {
   
    let title: String
    let duration: Int
    let thumbnailURL: String
  
    enum CodingKeys: String, CodingKey {
        case title, duration, thumbnailURL = "thumbnailUrl"
    }
}

typealias ProgramOrg = [ProgramOrgElement]
