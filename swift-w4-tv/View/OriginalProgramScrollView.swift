//
//  File.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class OriginalProgramScrollView {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    private var programScrollView : UIScrollView = UIScrollView()
    
    func initOriginalProgramScrollView(view : UIViewController){
        programScrollView.frame = CGRect(x: 0, y: screenHeight / 3, width: screenWidth, height: screenHeight*2 / 3 )
        programScrollView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        view.view.addSubview(programScrollView)
    }
}
