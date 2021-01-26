//
//  Clip.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/25.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

struct Clip: Codable {
    
    struct ClipGeoBlock: Codable {
        let geoBlockType: String?
        let nations: [String]?
    }
    
    let id: Int?
    let vid: String?
    let title: String?
    let description: String?
    let userId: Int?
    let channelId: Int?
    let categoryId: Int?
    let status: String?
    let duration: Int?
    let isVertical: Bool?
    let thumbnailUrl: String?
    let sourceUrl: String?
    let ageLimit: String?
    let playCount: Int?
    let likeCount: Int?
    let commentCount: Int?
    let createTime: String?
    let violationType: String?
    let clipGeoBlock: ClipGeoBlock?
    
}
