//
//  JsonParsing.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class JsonParsing  {
    var originalPrograms : [ProgramOrgElement]!
    var livePrograms : [ProgramLiveElement]!
    
    func getCnt(type: ProgramTypes) -> Int{
        switch type {
        case .Original :
            return originalPrograms.count
        default:
            return livePrograms.count
        }
    }
    
    init(){
        for type in ProgramTypes.programTypes {
            parsingData(type : type)
        }
    }
    
    func parsingData(type : ProgramTypes){
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        if type == .Original {
            do {
                guard let originalDataAsset = NSDataAsset.init(name: "Original") else { return }
                originalPrograms = try decoder.decode([ProgramOrgElement].self, from: originalDataAsset.data)
            } catch {
                originalPrograms = nil
            }
        }
        else {
            do {
                guard let liveDataAsset = NSDataAsset.init(name: "Live") else { return }
                livePrograms = try decoder.decode([ProgramLiveElement].self, from: liveDataAsset.data)
            } catch {
                livePrograms = nil
            }
        }
    }
}
