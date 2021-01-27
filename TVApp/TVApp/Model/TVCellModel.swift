//
//  TVCellModel.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import Foundation


struct Channel : Codable{
    let name : String
    let visitCount : Int
    let createTime : String
    
}

struct Clip : Codable {
    let thumbnailUrl : String
    let duration : Int
    let title : String
}

struct Live : Codable {
    let thumbnailUrl : String
    let playCount : Int
    let title : String
}

struct TVOriginal : Codable {
    private let channel : Channel
    private let clip : Clip
    
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
    private let channel : Channel
    private let live : Live

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
