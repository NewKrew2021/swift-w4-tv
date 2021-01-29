//
//  CollectionViewCell.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/26.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: ThumbnailUIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: DurationUILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    @IBOutlet weak var animationImageView: UIImageView!
    private let convert = Convert()
    var video : Video? = nil
    
    func setOriginalData(video: Video) {
        self.video = video
        thumbnailImageView.image = UIImage(named: video.clip?.thumbnailUrl ?? "")
        titleLabel.text = video.clip?.title
        durationLabel.setTextAndFixSize(text: convert.convertDuration(duration: video.clip?.duration ?? 0))
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convert.convertVisitCount(visitCount: video.channel.visitCount))  • \(convert.convertCreateTime(createTime: video.createTime))"
    }
    
    func setLiveData(video: Video) {
        self.video = video
        thumbnailImageView.image = UIImage(named: video.live?.thumbnailUrl ?? "")
        titleLabel.text = video.live?.title
        durationLabel.setTextAndFixSize(text: "🎧\(video.live?.playCount ?? 0)")
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convert.convertVisitCount(visitCount: video.channel.visitCount))  • \(convert.convertCreateTime(createTime: video.live!.createTime))"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
}
