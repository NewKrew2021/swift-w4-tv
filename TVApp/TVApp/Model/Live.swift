//
//  Live.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/25.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

class Live: Codable {
    
    struct Service: Codable {
        let name: String?
    }
    
    let id: Int?
    let userId: Int?
    let channelId: Int?
    let categoryId: Int?
    let liveType: String?
    let title: String?
    let description: String?
    let status: String?
    let isOpen: Bool?
    let canScrap: Bool?
    let canLink: Bool?
    let shouldGeoBlock: Bool?
    let ageLimit: String?
    let startTime: String?
    let reportCount: Int?
    let createTime: String?
    let playCount: Int?
    let likeCount: Int?
    let service: Service?
    let thumbnailUrl: String?
    let ccuCount: String?
    let duration: Int?
    let isShowCcuCount: Bool?
    
}

