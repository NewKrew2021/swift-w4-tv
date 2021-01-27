//
//  TVCellData.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import Foundation

class CellData {
    class var resourceName : String {
        return ""
    }
    
    func initializeData<T : CellData, T2 : Codable>(_ type : T.Type, _ outputType : T2.Type) -> [T2]{
        guard let path = Bundle.main.path(forResource: T.resourceName, ofType: "json") else { return [] }
        guard let StringData = try? String(contentsOfFile: path) else { return [] }
        guard let data = StringData.data(using: .utf8) else { return [] }
        do {
            let result : [T2] = try JSONDecoder().decode([T2].self, from: data)
            return result
        }
        catch {
            return []
        }
    }
}

class OriginalData : CellData{
    private var dataArray : [TVOriginal] = []
    override class var resourceName: String {
        return "original"
    }
    
    override init() {
        super.init()
        dataArray = initializeData(OriginalData.self, TVOriginal.self)
    }
    
    func count() -> Int {
        return dataArray.count
    }
    
    func getData(index : Int) -> TVOriginal {
        return dataArray[index]
    }
}

class LiveData : CellData{
    private var dataArray : [TVLive] = []
    override class var resourceName: String {
        return "live"
    }
    
    override init() {
        super.init()
        dataArray = initializeData(LiveData.self, TVLive.self)
    }
    
    func count() -> Int {
        return dataArray.count
    }

    func getData(index : Int) -> TVLive {
        return dataArray[index]
    }
}
