//
//  Program.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class ProgramView {
    var programList : [UIView] = []
    var programJsonData = JsonParsing().getData()
    init(){
        for data in programJsonData {
            if let view = programCell().makeView(data) as! UIView {
                programList.append(view)
            }
        }
    }
}
