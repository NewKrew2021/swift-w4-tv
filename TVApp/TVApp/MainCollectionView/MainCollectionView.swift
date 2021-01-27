//
//  MainCollectionView.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/27.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import UIKit
import Foundation

class MainCollectionView: UICollectionView {
    
    private var TVDatas = TVData()
    var currentSegment = EnumModel.VideoType.original
    
    func initView() {
        
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.delegate = self
        self.dataSource = self
        initLayout()
        
    }
    
    func initLayout() {
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            //item 높이: 사진의 높이 + 텍스트 높이 + view 간격 합
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(self.frame.width * 37/62 + 40 + 25))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        self.collectionViewLayout = layout
        
    }
    
}

extension MainCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch currentSegment {
        case .original:
            return TVDatas.originalTVs.count
        case .live:
            return TVDatas.liveTVs.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        switch currentSegment {
        case .original:
            cell.updateOriginalTV(originalTV: TVDatas.originalTVs[indexPath.row])
        case .live:
            cell.updateLiveTV(liveTV: TVDatas.liveTVs[indexPath.row])
        }
        return cell
        
    }
    
}
