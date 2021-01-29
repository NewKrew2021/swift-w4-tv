//
//  favorite.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/28.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

struct favoriteProgram: Codable {
    var title : String
    var channelName : String
    var id : Int
}

struct favorite {
    static var favoriteList : [favoriteProgram] = UserDefault.getData()
    
    static func addOrRemoveProgram(title: String, channelName: String, id: Int){
        for t in 0..<favoriteList.count {
            if favoriteList[t].id == id {
                remove(index: t)
                return
            }
        }
        addProgram(title: title, channelName: channelName, id: id)
    }
    
    static func addProgram(title: String, channelName: String, id: Int){
        print("추가")
        self.favoriteList.append(favoriteProgram(title: title, channelName: channelName, id: id))
        printAll()
    }
    
    static func remove(index: Int){
        self.favoriteList.remove(at: index)
        
        print("삭제")
        printAll()
    }
    
    static func saveUserDefault(){
        UserDefaults.standard.removeObject(forKey: "favorite")
        UserDefault.addData(self.favoriteList)
        printAll()
    }
    
    static func printAll(){
        for t in favoriteList {
            print("\(t.title) \(t.id)")
        }
    }
}

struct UserDefault {
    
    static let db = UserDefaults.standard
    
    static func getData() -> [favoriteProgram] {
        var array: [favoriteProgram] = []
        if let data = db.data(forKey: "favorite") {
            let dataArray = try! PropertyListDecoder().decode([favoriteProgram].self, from: data)
            array = dataArray
        }
        return array
    }
    
    static func addData(_ dataArray: [favoriteProgram]) {
        if let data = try? PropertyListEncoder().encode(dataArray){
            UserDefault.db.set(data, forKey: "favorite")
        }
    }
}
