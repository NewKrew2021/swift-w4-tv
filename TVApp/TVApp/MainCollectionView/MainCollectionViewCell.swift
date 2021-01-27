//
//  MainCollectionViewCell.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!    
    @IBOutlet weak var thumbnailLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var visitCountLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    var present = MainCollectionViewPresent()
    
    func updateOriginalTV(originalTV: OriginalTV) {
        
        thumnbnailImageView.image = UIImage(named: (originalTV.clip?.thumbnailUrl!)!)
        titleLabel.text = originalTV.clip?.title
        thumbnailLabel.text = present.getDuration((originalTV.clip?.duration)!)
        channelLabel.text = originalTV.channel?.name
        visitCountLabel.text = "▶︎ \(String((originalTV.channel?.visitCount)! as Int))"
        createTimeLabel.text = present.getCreateTime(originalTV.createTime!)
        
    }
    
    func updateLiveTV(liveTV: LiveTV) {
        
        thumnbnailImageView.image = UIImage(named: (liveTV.live?.thumbnailUrl!)!)
        titleLabel.text = liveTV.live?.title
        thumbnailLabel.text = present.getDuration((liveTV.live?.duration)!)
        channelLabel.text = liveTV.channel?.name
        visitCountLabel.text = "▶︎ \(String((liveTV.channel?.visitCount)! as Int))"
        createTimeLabel.text = present.getCreateTime(liveTV.createTime!)
        
    }
    
}
