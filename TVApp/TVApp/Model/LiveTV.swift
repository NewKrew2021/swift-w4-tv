//
//  LiveTV.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

struct LiveTV: Codable {
    
    let id: Int?
    let channelId: Int?
    let iveId: Int?
    let displayTitle: String?
    let createTime: String?
    let channel: Channel?
    let live: Live?
    let videoType: String?
    
}
