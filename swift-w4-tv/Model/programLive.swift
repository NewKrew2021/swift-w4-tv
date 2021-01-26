//
//  programLive.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let programLive = try? newJSONDecoder().decode(ProgramLive.self, from: jsonData)
import Foundation

// MARK: - ProgramLiveElement
struct ProgramLiveElement: Codable {
    let id, channelID, liveID: Int
    let displayTitle, createTime: String
    let channel: liveChannel
    let live: Live
    let videoType: String

    enum CodingKeys: String, CodingKey {
        case id
        case channelID = "channelId"
        case liveID = "liveId"
        case displayTitle, createTime, channel, live, videoType
    }
}

// MARK: - Channel
struct liveChannel: Codable {
    let id, userID: Int
    let categoryID: JSONNull?
    let name, channelDescription: String
    let headPlaylistID: JSONNull?
    let subscriberCount, visitCount: Int
    let isOpen, shouldFeedSearcher, isLegacy: Bool
    let createTime: String
    let canAutoUploadLiveClip, canUploadClip: Bool
    let clipCount: Int
    let canLive: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case categoryID = "categoryId"
        case name
        case channelDescription = "description"
        case headPlaylistID = "headPlaylistId"
        case subscriberCount, visitCount, isOpen, shouldFeedSearcher, isLegacy, createTime, canAutoUploadLiveClip, canUploadClip, clipCount, canLive
    }
}

// MARK: - Live
struct Live: Codable {
    let id, userID, channelID, categoryID: Int
    let liveType, title, liveDescription, status: String
    let isOpen, canScrap, canLink, shouldGeoBlock: Bool
    let ageLimit, startTime: String
    let reportCount: Int
    let createTime: String
    let playCount, likeCount: Int
    let service: Service
    let thumbnailURL, ccuCount: String
    let duration: Int
    let isShowCcuCount: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case channelID = "channelId"
        case categoryID = "categoryId"
        case liveType, title
        case liveDescription = "description"
        case status, isOpen, canScrap, canLink, shouldGeoBlock, ageLimit, startTime, reportCount, createTime, playCount, likeCount, service
        case thumbnailURL = "thumbnailUrl"
        case ccuCount, duration, isShowCcuCount
    }
}

// MARK: - Service
struct Service: Codable {
    let name: String
}

typealias ProgramLive = [ProgramLiveElement]


