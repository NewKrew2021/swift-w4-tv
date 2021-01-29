//
//  CollectionView.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import UIKit

class CollectionView: UICollectionView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
    }

}
