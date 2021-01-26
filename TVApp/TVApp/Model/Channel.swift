//
//  Channel.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/25.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

class Channel: Codable{

    var id: Int?
    var userId: Int?
    var categoryId: Int?
    var name: String?
    var description: String?
    var headPlaylistId: Int?
    var subscriberCount: Int?
    var visitCount: Int?
    var isOpen: Bool?
    var shouldFeedSearcher: Bool?
    var isLegacy: Bool?
    var createTime: String?
    var canAutoUploadLiveClip: Bool?
    var canUploadClip: Bool?
    var clipCount: Int?
    var canLive: Bool?
    
}
