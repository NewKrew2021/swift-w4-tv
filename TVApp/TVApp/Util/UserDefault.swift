//
//  UserDefault.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/29.
//

import Foundation

class UserDefault {
    private static let key = "likes"
    
    static func getData() -> Dictionary<Int, Like> {
        var dictionary = Dictionary<Int, Like>()
        if let data = UserDefaults.standard.data(forKey: key) {
            let tempDict = try! PropertyListDecoder().decode(Dictionary<Int, Like>.self, from: data)
            dictionary = tempDict
        }
        return dictionary
    }
    
    static func setData(dict : Dictionary<Int, Like>) {
        if let data = try? PropertyListEncoder().encode(dict) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
