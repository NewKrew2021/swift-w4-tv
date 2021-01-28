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
    
    func addOrRemoveProgram(title: String, channelName: String, id: Int){
        for t in 0..<favoriteList.count {
            if favoriteList[t].id == id {
                remove(index: t)
                return
            }
        }
        addProgram(title: title, channelName: channelName, id: id)
    }
    
    func addProgram(title: String, channelName: String, id: Int){
        favoriteList.append(favoriteProgram(title: title, channelName: channelName, id: id))
    }
    
    func remove(index: Int){
        favoriteList.remove(at: index)
    }
    
    func saveUserDefault(){
        UserDefaults.standard.removeObject(forKey: "histories")
        UserDefault.addData(self.favoriteList)
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
