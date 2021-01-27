//
//  CollectionViewCell.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/26.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: DurationUILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    private let convert = Convert()
    
    func setOriginalData(video: Video) {
        thumbnailImageView.image = UIImage(named: video.clip?.thumbnailUrl ?? "")
        titleLabel.text = video.clip?.title
        durationLabel.setTextAndFixSize(text: convert.convertDuration(duration: video.clip?.duration ?? 0))
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convert.convertVisitCount(visitCount: video.channel.visitCount))  • \(convert.convertCreateTime(createTime: video.createTime))"
    }
    
    func setLiveData(video: Video) {
        thumbnailImageView.image = UIImage(named: video.live?.thumbnailUrl ?? "")
        titleLabel.text = video.live?.title
        durationLabel.setTextAndFixSize(text: "🎧\(video.live?.playCount ?? 0)")
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convert.convertVisitCount(visitCount: video.channel.visitCount))  • \(convert.convertCreateTime(createTime: video.live!.createTime))"
    }
    
    
}
