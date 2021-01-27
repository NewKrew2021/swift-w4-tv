//
//  Content.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/27.
//

import Foundation
import UIKit

class Content {
    var title: String
    var thumbnail: UIImage?
    var channelName: String
    var viewCount: String
    var createTime: String
    init(title: String, thumbnail: UIImage?, channelName: String, viewCount: String, createTime: String){
        self.title = title
        self.thumbnail = thumbnail
        self.channelName = channelName
        self.viewCount = viewCount
        self.createTime = createTime
    }
    
//    convenience init(original: OriginalContentData) {
//        let title = original.displayTitle
//        let thumbnail = UIImage(named: original.thumbnailUrl)
//        let channelName = original.channel.name
//        let viewCount = Int.getNumWithCommaFormat(number: original.channelVisitCount)
//        let createTime = original.createTime
//        self.init(title: title, thumbnail: thumbnail, channelName: channelName, viewCount: viewCount, createTime: createTime)
//    }
//    
//    convenience init(live: LiveContentData) {
//        let title = live.displayTitle
//        let thumbnail = UIImage(named: live.thumbnailUrl)
//        let channelName = live.channel.name
//        let viewCount = Int.getNumWithCommaFormat(number: live.playCount)
//        let createTime = live.createTime
//        self.init(title: title, thumbnail: thumbnail, channelName: channelName, viewCount: viewCount, createTime: createTime)
//    }
}
