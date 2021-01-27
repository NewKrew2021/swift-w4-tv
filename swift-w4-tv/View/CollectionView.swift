//
//  CollectionView.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/26.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class CollectionView {
    
    var myView: UICollectionView!
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    init(){
        let flowLayout = UICollectionViewFlowLayout()
        myView = UICollectionView(frame: CGRect(x: 0, y: self.screenHeight/5, width: self.screenWidth, height: self.screenHeight*4/5), collectionViewLayout: flowLayout)
        myView.backgroundColor = .white
        myView.register(OriginalCollectionViewCell.self, forCellWithReuseIdentifier: OriginalCollectionViewCell.cellIdentifier)
        myView.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: LiveCollectionViewCell.cellIdentifier)
    }
    
    func reloadData(){
        myView.reloadData()
    }
}
