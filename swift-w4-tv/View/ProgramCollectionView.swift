//
//  ProgramCollectionView.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/29.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class ProgramCollectionView: UICollectionView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
    }
    
}
