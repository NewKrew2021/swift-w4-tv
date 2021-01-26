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
    let channel: Channel
    let live: Live
    let videoType: VideoType

    enum CodingKeys: String, CodingKey {
        case id
        case channelID = "channelId"
        case liveID = "liveId"
        case displayTitle, createTime, channel, live, videoType
    }
}

// MARK: - Live
struct Live: Codable {
    let id, userID, channelID, categoryID: Int
    let liveType: LiveType
    let title, liveDescription: String
    let status: Status
    let isOpen, canScrap, canLink, shouldGeoBlock: Bool
    let ageLimit: AgeLimit
    let startTime: String
    let reportCount: Int
    let createTime: String
    let playCount, likeCount: Int
    let service: Service
    let thumbnailURL, ccuCount: String
    let duration: Int
    let isShowCcuCount: Bool
    let liveGeoBlock: LiveGeoBlock?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case channelID = "channelId"
        case categoryID = "categoryId"
        case liveType, title
        case liveDescription = "description"
        case status, isOpen, canScrap, canLink, shouldGeoBlock, ageLimit, startTime, reportCount, createTime, playCount, likeCount, service
        case thumbnailURL = "thumbnailUrl"
        case ccuCount, duration, isShowCcuCount, liveGeoBlock
    }
}

enum AgeLimit: String, Codable {
    case all = "ALL"
}

// MARK: - LiveGeoBlock
struct LiveGeoBlock: Codable {
    let geoBlockType: String
    let nations: [String]
}

enum LiveType: String, Codable {
    case streaming = "STREAMING"
}

// MARK: - Service
struct Service: Codable {
    let name: Name
}

enum Name: String, Codable {
    case kakaoTv = "kakao_tv"
}

enum Status: String, Codable {
    case onair = "ONAIR"
}

enum VideoType: String, Codable {
    case live = "LIVE"
}

typealias ProgramLive = [ProgramLiveElement]
