//
//  TVCellModel.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import Foundation

protocol TVCell {
    var thumbNail : String { get }
    var clipTitle : String { get }
    var channelName : String { get }
    var channelVisitCount : Int { get }
    var channelCreateTime : String { get }
}

struct TVOriginalCell : TVCell {
    internal var thumbNail: String
    internal var clipTitle: String
    internal var channelName: String
    internal var channelVisitCount: Int
    internal var channelCreateTime: String
    private var clipDuration : String
    
    init(thumbNail : String, clipTitle : String, channelName : String, channelVisitCount : Int, channelCreateTime : String, clipDuration : String) {
        self.thumbNail = thumbNail
        self.clipTitle = clipTitle
        self.channelName = channelName
        self.channelVisitCount = channelVisitCount
        self.channelCreateTime = channelCreateTime
        self.clipDuration = clipDuration
    }
}

struct TVLiveCell : TVCell {
    internal var thumbNail: String
    internal var clipTitle: String
    internal var channelName: String
    internal var channelVisitCount: Int
    internal var channelCreateTime: String
    private var livePlayCount : String
    
    init(thumbNail : String, clipTitle : String, channelName : String, channelVisitCount : Int, channelCreateTime : String, livePlayCount : String) {
        self.thumbNail = thumbNail
        self.clipTitle = clipTitle
        self.channelName = channelName
        self.channelVisitCount = channelVisitCount
        self.channelCreateTime = channelCreateTime
        self.livePlayCount = livePlayCount
    }
}
