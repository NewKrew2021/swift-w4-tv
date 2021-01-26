//
//  programOrg.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let programOrg = try? newJSONDecoder().decode(ProgramOrg.self, from: jsonData)

import Foundation

// MARK: - ProgramOrgElement
struct ProgramOrgElement: Codable {
    let id, channelID, clipID: Int
    let displayTitle, createTime: String
    let channel: Channel
    let clip: Clip
    let videoType: String

    enum CodingKeys: String, CodingKey {
        case id
        case channelID = "channelId"
        case clipID = "clipId"
        case displayTitle, createTime, channel, clip, videoType
    }
}

// MARK: - Channel
struct Channel: Codable {
    let id, userID, categoryID: Int
    let name, channelDescription: String
    let headPlaylistID, subscriberCount, visitCount: Int
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

// MARK: - Clip
struct Clip: Codable {
    let id: Int
    let vid, title, clipDescription: String
    let userID, channelID, categoryID: Int
    let status: String
    let duration: Int
    let isVertical: Bool
    let thumbnailURL: String
    let sourceURL: JSONNull?
    let ageLimit: String
    let playCount, likeCount, commentCount: Int
    let createTime: String
    let violationType: JSONNull?
    let clipGeoBlock: ClipGeoBlock
    let adultThumbnail, wasLive, like: Bool?

    enum CodingKeys: String, CodingKey {
        case id, vid, title
        case clipDescription = "description"
        case userID = "userId"
        case channelID = "channelId"
        case categoryID = "categoryId"
        case status, duration, isVertical
        case thumbnailURL = "thumbnailUrl"
        case sourceURL = "sourceUrl"
        case ageLimit, playCount, likeCount, commentCount, createTime, violationType, clipGeoBlock, adultThumbnail, wasLive, like
    }
}

// MARK: - ClipGeoBlock
struct ClipGeoBlock: Codable {
    let geoBlockType: String
    let nations: [String]
}

typealias ProgramOrg = [ProgramOrgElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
}
