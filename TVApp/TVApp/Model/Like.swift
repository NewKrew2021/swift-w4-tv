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
        } else {
            data.removeValue(forKey: id)
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
