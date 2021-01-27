//
//  Json.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/27.
//

import UIKit

struct Json {
    func parsing(type : MainViewController.VideoType) {
        var video : [Video] = []
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let originalDataAsset: NSDataAsset = NSDataAsset.init(name: "original") else {return}
        guard let liveDataAsset: NSDataAsset = NSDataAsset.init(name: "live") else {return}

        do {
            if type == .original {
                video =  try jsonDecoder.decode([Video].self, from: originalDataAsset.data)
            } else if type == .live {
                video = try jsonDecoder.decode([Video].self, from: liveDataAsset.data)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jsonParsing"),object: nil, userInfo: ["video" : video])
        } catch let error {
            print("error: ", error)
        }
    }
}
