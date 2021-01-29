//
//  Like.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import Foundation

struct Likes {
    private static var data = LikeData.getData() ?? [Int : Like]()
    static var count : Int {
        return data.count
    }
    
    static func addOrRemoveLike(id : Int, like : Like) {
        if data[id] == nil {
            data[id] = like
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "likeAnimation"),object: nil, userInfo: ["doLike" : true])
        } else {
            data.removeValue(forKey: id)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "likeAnimation"),object: nil, userInfo: ["doLike" : false])
        }
        LikeData.updateData(data)
    }
    
    static func getKeys() -> Dictionary<Int, Like>.Keys {
        return data.keys
    }
    
    static func getItem(key : Int) -> Like? {
        return data[key]
    }
}

struct Like: Codable {
    let title: String
    let channelName: String
}
