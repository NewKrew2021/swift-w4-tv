//
//  SegmentControll.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/26.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class SegmentControl {
    private var sc = UISegmentedControl(items: ["Original", "Live"])
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    
    func initSegmentControl(view : UIViewController){
        sc.frame = CGRect(x: screenWidth * 0.1, y: view.topbarHeight + screenHeight / 20 , width: screenWidth * 0.8, height: screenHeight / 30 )
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(BtnPressed(_:)), for: .valueChanged)
        view.view.addSubview(sc)
    }
    
    @objc func BtnPressed(_ sender:UISegmentedControl!){
        
    }
    
    

}
