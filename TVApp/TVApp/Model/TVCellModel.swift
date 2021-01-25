//
//  TVCellModel.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import Foundation


struct Channel : Codable{
    var name : String
    var visitCount : Int
    var createTime : String
    var a : Int
}

struct Clip : Codable {
    var thumbnailUrl : String
    var duration : Int
    var title : String
}

struct Live : Codable {
    var thumbnailUrl : String
    var playCount : Int
    var title : String
}

struct TVOriginal : Codable {
    private var clip : Clip
    private var channel : Channel
}

struct TVLive : Codable {
    private var live : Live
    private var channel : Channel
}





//struct jsonCell : Codable {
//    private let id : Int
//    private let channelId : Int
//    private let liveId : Int
//    private let displayTitle : String
//    private let createTime : String
//    private let channel : Channel
//    private let live : Live
//    private let videoType : String
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        id = try container.decode(Int.self, forKey: .id)
////        channelId = try container.decode(Int.self, forKey: .channelId)
////        liveId = try container.decode(Int.self, forKey: .liveId)
////        displayTitle = try container.decode(String.self, forKey: .displayTitle)
////        createTime = try container.decode(String.self, forKey: .createTime)
////        videoType = try container.decode(String.self, forKey: .videoType)
////
////        channel = try decoder.singleValueContainer().decode(Channel.self)
////        live = try decoder.singleValueContainer().decode(Live.self)
////    }
//}
//
//struct Channel : Codable {
//    private let id : Int
//    private let userId : Int
//    private let categoryId : String
//    private let name : String
//    private let description : String
//    private let headPlaylistId : String
//    private let subscriberCount : Int
//    private let visitCount : Int
//    private let isOpen: Bool
//    private let shouldFeedSearcher : Bool
//    private let isLegacy : Bool
//    private let createTime : String
//    private let canAutoUploadLiveClip : Bool
//    private let canUploadClip : Bool
//    private let clipCount : Int
//    private let canLive : Bool
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        id = try container.decode(Int.self, forKey: .id)
////        userId = try container.decode(Int.self, forKey: .userId)
////        categoryId = try container.decode(String.self, forKey: .categoryId)
////        name = try container.decode(String.self, forKey: .name)
////        description = try container.decode(String.self, forKey: .description)
////        headPlaylistId = try container.decode(String.self, forKey: .headPlaylistId)
////        subscriberCount = try container.decode(Int.self, forKey: .subscriberCount)
////        visitCount = try container.decode(Int.self, forKey: .visitCount)
////        isOpen = try container.decode(Bool.self, forKey: .isOpen)
////        shouldFeedSearcher = try container.decode(Bool.self, forKey: .shouldFeedSearcher)
////        isLegacy = try container.decode(Bool.self, forKey: .isLegacy)
////        createTime = try container.decode(String.self, forKey: .createTime)
////        canAutoUploadLiveClip = try container.decode(Bool.self, forKey: .canAutoUploadLiveClip)
////        canUploadClip = try container.decode(Bool.self, forKey: .canUploadClip)
////        clipCount = try container.decode(Int.self, forKey: .clipCount)
////        canLive = try container.decode(Bool.self, forKey: .canLive)
////    }
//}
//
//struct Live : Codable {
//    private let id : Int
//    private let userId : Int
//    private let channelId : Int
//    private let categoryId : Int
//    private let liveType : String
//    private let title : String
//    private let description : String
//    private let status : String
//    private let isOpen : Bool
//    private let canScrap : Bool
//    private let canLink : Bool
//    private let shouldGeoBlock : Bool
//    private let ageLimit : String
//    private let startTime : String
//    private let reportCount : Int
//    private let createTime : String
//    private let playCount : Int
//    private let likeCount : Int
//    private let service : Service
//    private let thumbnailUrl : String
//    private let ccuCount : String
//    private let duration : Int
//    private let isShowCcuCount : Bool
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        id = try container.decode(Int.self, forKey: .id)
////        userId = try container.decode(Int.self, forKey: .userId)
////        channelId = try container.decode(Int.self, forKey: .channelId)
////        categoryId = try container.decode(Int.self, forKey: .categoryId)
////        liveType = try container.decode(String.self, forKey: .liveType)
////        title = try container.decode(String.self, forKey: .title)
////        description = try container.decode(String.self, forKey: .description)
////        status = try container.decode(String.self, forKey: .status)
////        isOpen = try container.decode(Bool.self, forKey: .isOpen)
////        canScrap = try container.decode(Bool.self, forKey: .canScrap)
////        canLink = try container.decode(Bool.self, forKey: .canLink)
////        shouldGeoBlock = try container.decode(Bool.self, forKey: .shouldGeoBlock)
////        ageLimit = try container.decode(String.self, forKey: .ageLimit)
////        startTime = try container.decode(String.self, forKey: .startTime)
////        reportCount = try container.decode(Int.self, forKey: .reportCount)
////        createTime = try container.decode(String.self, forKey: .createTime)
////        playCount = try container.decode(Int.self, forKey: .playCount)
////        likeCount = try container.decode(Int.self, forKey: .likeCount)
////        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
////        ccuCount = try container.decode(String.self, forKey: .ccuCount)
////        duration = try container.decode(Int.self, forKey: .duration)
////        isShowCcuCount = try container.decode(Bool.self, forKey: .isShowCcuCount)
////
////        service = try decoder.singleValueContainer().decode(Service.self)
////    }
//}
//
//struct Service : Codable {
//    private let name : String
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        name = try container.decode(String.self, forKey: .name)
////    }
//}
//

