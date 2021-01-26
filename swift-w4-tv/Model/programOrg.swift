//
//  program.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

struct programOrg {
    var clipTitle : String
    var clipThumnailUrl : String
    var clipDuration : Int
    var channelName : String
    var channelVisitCount : Int
    var channelCreateTime : String
}

struct programLive {
    var clipTitle : String
    var clipThumnailUrl : String
    var livePlayCount : Int
    var channelName : String
    var channelVisitCount : Int
    var channelCreateTime : String
}
