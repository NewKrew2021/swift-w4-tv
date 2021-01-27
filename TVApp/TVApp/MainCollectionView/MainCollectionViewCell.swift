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
    
    func updateOriginalTV(originalTV: OriginalTV) {
        
        thumnbnailImageView.image = UIImage(named: (originalTV.clip?.thumbnailUrl!)!)
        titleLabel.text = originalTV.clip?.title
        thumbnailLabel.text = String((originalTV.clip?.duration)! as Int)
        channelLabel.text = originalTV.channel?.name
        visitCountLabel.text = "▶︎"+String((originalTV.channel?.visitCount)! as Int)
        createTimeLabel.text = originalTV.createTime
        
    }
    
    func updateLiveTV(liveTV: LiveTV) {
        
        thumnbnailImageView.image = UIImage(named: (liveTV.live?.thumbnailUrl!)!)
        titleLabel.text = liveTV.live?.title
        thumbnailLabel.text = String((liveTV.live?.duration)! as Int)
        channelLabel.text = liveTV.channel?.name
        visitCountLabel.text = "▶︎"+String((liveTV.channel?.visitCount)! as Int)
        createTimeLabel.text = liveTV.createTime
        
    }
    
}
