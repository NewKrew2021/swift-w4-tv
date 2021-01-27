//
//  programOrg.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.

import Foundation

struct ProgramOrgElement: Codable {
    let channel: Channel
    let clip: Clip

    enum CodingKeys: String, CodingKey {
        case channel, clip
    }
}

typealias ProgramOrg = [ProgramOrgElement]
