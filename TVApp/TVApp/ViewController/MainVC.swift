//
//  MainVC.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var mainSegmentControl: UISegmentedControl!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    let sampleData = SampleData()
    var currentSegment = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        
        mainCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        var width = UIScreen.main.bounds.size.width
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            //item 높이: 사진의 높이 + 텍스트 높이 + view 간격 합
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute((width - 30) * 37/62 + 50 + 30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

            let section = NSCollectionLayoutSection(group: group)
            return section

        }
        mainCollectionView.collectionViewLayout = layout
        
    }
    
    @IBAction func mainSegmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            currentSegment = 0
        case 1:
            currentSegment = 1
        default:
            return
        }
        mainCollectionView.reloadData()
        
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(currentSegment == 0) {
            return sampleData.originalTVs.count
        }
        else {
            return sampleData.liveTVs.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        if(currentSegment == 0) {
            cell.thumnbnailImageView.image = UIImage(named: (sampleData.originalTVs[indexPath.row].clip?.thumbnailUrl!)!)
            cell.titleLabel.text = sampleData.originalTVs[indexPath.row].clip?.title
            cell.thumbnailLabel.text = String((sampleData.originalTVs[indexPath.row].clip?.duration)! as Int)
            cell.channelLabel.text = sampleData.originalTVs[indexPath.row].channel?.name
            cell.visitCountLabel.text = "▶︎"+String((sampleData.originalTVs[indexPath.row].channel?.visitCount)! as Int)
            cell.createTimeLabel.text = sampleData.originalTVs[indexPath.row].createTime
        }
        else {
            cell.thumnbnailImageView.image = UIImage(named: (sampleData.liveTVs[indexPath.row].live?.thumbnailUrl!)!)
            cell.titleLabel.text = sampleData.liveTVs[indexPath.row].live?.title
            cell.thumbnailLabel.text = String((sampleData.liveTVs[indexPath.row].live?.duration)! as Int)
            cell.channelLabel.text = sampleData.liveTVs[indexPath.row].channel?.name
            cell.visitCountLabel.text = "▶︎"+String((sampleData.liveTVs[indexPath.row].channel?.visitCount)! as Int)
            cell.createTimeLabel.text = sampleData.liveTVs[indexPath.row].createTime
        }
        return cell
    
    }
    
}

