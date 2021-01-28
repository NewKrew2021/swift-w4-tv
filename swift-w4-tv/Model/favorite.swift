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

class favorite {
    var favoriteList : [favoriteProgram]
    var listCnt : Int
    
    init(){
        favoriteList = UserDefault.getData()
        listCnt = favoriteList.count
    }
    
    func addProgram(title: String, channelName: String, id: Int){
        favoriteList.append(favoriteProgram(title: title, channelName: channelName, id: id))
        printAll()
    }
    
    func remove(id: Int){
        for t in 0..<favoriteList.count {
            if favoriteList[t].id == id {
                favoriteList.remove(at: t)
                return
            }
        }
        printAll()
    }
    
    func saveUserDefault(){
        UserDefaults.standard.removeObject(forKey: "histories")
        UserDefault.addData(self.favoriteList)
    }
    
    func printAll(){
        for t in favoriteList{
            print("\(t.title)  \(t.channelName)  \(t.id)")
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

struct History: Codable {
    let title: String
    let date: String
}
