//
//  TVCellData.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import Foundation

class OriginalData {
    static let shared = OriginalData()
    private var dataArray : [TVOriginal] = []
    
    private init() {
        guard let path = Bundle.main.path(forResource: "original", ofType: "json") else { return }
        guard let StringData = try? String(contentsOfFile: path) else { return }
        guard let data = StringData.data(using: .utf8) else { return }
        do {
            let result : [TVOriginal] = try JSONDecoder().decode([TVOriginal].self, from: data)
            dataArray = result
        }
        catch let error {
            print(error)
        }
    }
}

class LiveData {
    static let shared = LiveData()
    private var dataArray : [TVLive] = []
    
    private init() {
        guard let path = Bundle.main.path(forResource: "live", ofType: "json") else { return }
        guard let StringData = try? String(contentsOfFile: path) else { return }
        guard let data = StringData.data(using: .utf8) else { return }
        do {
            let result: [TVLive] = try JSONDecoder().decode([TVLive].self, from: data)
            dataArray = result
        }
        catch let error {
            print(error)
        }
    }
}
