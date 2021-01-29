//
//  Likes.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/28.
//

import Foundation

class Likes {
    private static var likes = Dictionary<Int, Like>()
    
    static func count() -> Int{
        return likes.count
    }
    
    static func insertOrDelete(like : Like) {
        if likes[like.id] == nil {
            likes[like.id] = like
        } else {
            likes.removeValue(forKey: like.id)
        }
    }
    
    static func isIn(key : Int) -> Bool {
        return likes[key] != nil ? true : false
    }
    
    static func getKeys() -> Dictionary<Int, Like>.Keys {
        return likes.keys
    }
    
    static func getLkieItem(key : Int) -> Like{
        return likes[key]!
    }
}

struct Like : Hashable{
    let title : String
    let channelName : String
    let id : Int
}
