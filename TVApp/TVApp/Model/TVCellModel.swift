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
    private var channel : Channel
    private var clip : Clip
    
    func getChannelName() -> String {
        return channel.name
    }
    
    func getVisitCount() -> Int {
        return channel.visitCount
    }
    
    func getCreateTime() -> String {
        return channel.createTime
    }
    
    func getClipThumbnailUrl() -> String {
        return clip.thumbnailUrl
    }
    
    func getClipDuration() -> Int {
        return clip.duration
    }
    
    func getClipTitle() -> String {
        return clip.title
    }
}

struct TVLive : Codable {
    private var channel : Channel
    private var live : Live

    func getChannelName() -> String {
        return channel.name
    }
    
    func getVisitCount() -> Int {
        return channel.visitCount
    }
    
    func getCreateTime() -> String {
        return channel.createTime
    }
    
    func getLiveThumbnailUrl() -> String {
        return live.thumbnailUrl
    }
    
    func getLivePlayCount() -> Int {
        return live.playCount
    }
    
    func getLiveTitle() -> String {
        return live.title
    }
}
