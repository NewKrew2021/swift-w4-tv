//
//  JsonParsing.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
/*
 {
     "id": 414397937,
     "channelId": 3665690,
     "clipId": 328776202,
     "displayTitle": "(FULL) 가짜사나이2 그 마지막 이야기.. [가짜사나이2] EP.8 [2020.11.27]",
     "createTime": "2020-11-27 12:00:00",
     "channel": {
         "id": 3665690,
         "userId": 7325194,
         "categoryId": 53,
         "name": "가짜사나이2",
         "description": "진짜가 되려는 가짜들의 도전! \n유명 방송인들이 MUSAT 특수 부대 훈련에 다시 한 번 도전한다.",
         "headPlaylistId": 367307,
         "subscriberCount": 12705,
         "visitCount": 3783015,
         "isOpen": true,
         "shouldFeedSearcher": true,
         "isLegacy": false,
         "createTime": "2020-09-24 16:16:06",
         "canAutoUploadLiveClip": false,
         "canUploadClip": true,
         "clipCount": 10,
         "canLive": true
     },
     "clip": {
         "id": 328776202,
         "vid": "rv43momzd67z8qn9ieyyiuasg",
         "title": "(FULL) 가짜사나이2 그 마지막 이야기.. [가짜사나이2] EP.8 [2020.11.27]",
         "description": "본 교육 프로그램 은 UDT교육이 아닌 MUSAT특별과정으로 군 특수전 교육을 모티브로 만들어졌습니다.\nMUSAT 특별 훈련 과정은 특정한 목적을 가진 특수부대 등에서만 시행되며 안전 감독관, 전문 의료진 및 UDT/SEAL 출신의 MUSAT 교관들의 안전 통제하에 진행되었으며 모든 훈련은 사유지에서 진행되었습니다 .\n\n참가자들의 고통스러워하는 장면을 부담스러워하실수 있는 분들의 시청에 특별한 주의를 부탁드리며 절대 따라 하지 마시길 바랍니다.\nDo Not Attempt to Duplicate.",
         "userId": 7325194,
         "channelId": 3665690,
         "categoryId": 53,
         "status": "AVAILABLE",
         "duration": 1702,
         "isVertical": false,
         "thumbnailUrl": "vod01.jpeg",
         "sourceUrl": null,
         "ageLimit": "AGE_15",
         "playCount": 549862,
         "likeCount": 3455,
         "commentCount": 0,
         "createTime": "2020-11-27 12:00:00",
         "violationType": null,
         "clipGeoBlock": {
             "geoBlockType": "ALLOW",
             "nations": ["KR"]
         }
     },
     "videoType": "CLIP"
 }
 */
class JsonParsing  {
    private var programs : [String : [programOrg]] = [:]
    private let videoType = ["original", "live"]
    
    init(){
        for type in videoType {
            if type == "original"{
                parsingData(type : type)
            }
        }
    }
    
    func parsingData(type : String){
        let FullPath = "/Users/harrison.tom/Desktop/Harrison/xcode/swift-w4-tv/swift-w4-tv/swift-w4-tv/"+type+".json"
        
        if let contents = try? String(contentsOfFile: FullPath).data(using: .utf16){
            let json = try! JSONSerialization.jsonObject(with: contents, options: []) as! [[String : Any]]
            var prg : [programOrg] = []
            for s in json {

                let clip  = s["clip"] as! [String : Any]
                let channel  = s["channel"] as! [String : Any]
                let title = clip["title"] as! String
                let ThumnailUrl = clip["thumbnailUrl"] as! String
                let duration = clip["duration"] as! Int
                let name = channel["name"] as! String
                let visitCount = channel["visitCount"] as! Int
                let createTime = channel["createTime"] as! String
                
                prg.append(programOrg(clipTitle: title, clipThumnailUrl: ThumnailUrl, clipDuration: duration, channelName: name, channelVisitCount: visitCount, channelCreateTime: createTime))
                
            }
            programs[type] = prg
        }
    }
    
    func getData() -> [String : [programOrg]]{
        return programs
    }
    
}
