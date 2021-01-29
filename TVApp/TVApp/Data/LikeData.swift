//
//  LikeData.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import Foundation

struct LikeData {
    static let db = UserDefaults.standard
    
    static func getData() -> [Int : Like]? {
        var likes: [Int : Like]?
        if let data = UserDefaults.standard.value(forKey:"like") as? Data {
            likes = try? PropertyListDecoder().decode([Int : Like].self, from: data)
        }
        return likes
    }
    
    static func updateData(_ data: [Int : Like]) {
        db.set(try? PropertyListEncoder().encode(data), forKey:"like")
    }
}
