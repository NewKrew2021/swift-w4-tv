//
//  TVCollectionView.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/28.
//

import UIKit

class TVCollectionTestView: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        print("TVCollectionView Hit Test!!")
        print(point)
        if hitView == nil {
            return self
        }
        return hitView
    }

}

