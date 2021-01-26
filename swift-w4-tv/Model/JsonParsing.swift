//
//  JsonParsing.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation

class JsonParsing  {
    var originalPrograms : [ProgramOrgElement]!
    var livePrograms : [ProgramLiveElement]!
    
    var getOrgCnt : Int {
        if originalPrograms == nil {
            return 0
        }
        return originalPrograms.count
    }
    
    var getliveCnt : Int {
        if livePrograms == nil {
            return 0
        }
        return livePrograms.count
    }
    
    private let videoType = ["original", "live"]

    init(){
        for type in videoType {
            parsingData(type : type)
        }
    }
    
    func parsingData(type : String){
        let FullPath = "/Users/harrison.tom/Desktop/Harrison/xcode/swift-w4-tv/swift-w4-tv/swift-w4-tv/"+type+".json"

        if let contents = try? String(contentsOfFile: FullPath).data(using: .utf16){
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
                if type == "original" {
                    do {
                        originalPrograms = try decoder.decode([ProgramOrgElement].self, from: contents)
                    } catch {
                        originalPrograms = nil
                    }
                }
                else {
                    do {
                        livePrograms = try decoder.decode([ProgramLiveElement].self, from: contents)
                    } catch {
                        livePrograms = nil
                    }
            }
        }
    }
}
