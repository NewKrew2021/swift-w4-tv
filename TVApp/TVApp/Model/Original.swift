//
//  Original.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/25.
//

import Foundation

struct Original : Codable {
    let id : Int
    let channelId : Int
    let clipId : Int?
    let liveId : Int?
    let channel : Channel
    let clip : Clip?
    let live : Live?
    let videoType : String
    let createTime : String
}
