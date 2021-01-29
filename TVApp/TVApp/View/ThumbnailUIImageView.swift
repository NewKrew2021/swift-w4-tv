//
//  ThumbnailUIImageView.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/28.
//

import UIKit

class ThumbnailUIImageView: UIImageView {
    var beganTimestamp : Double = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
    }
    
    override func layoutSubviews() {
        self.isUserInteractionEnabled = true
    }
}
