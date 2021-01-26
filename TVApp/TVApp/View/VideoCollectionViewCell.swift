//
//  VideoCollectionViewCell.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/26.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelViewCount: UILabel!
    @IBOutlet weak var videoCreateTime: UILabel!
    
    func setThumbnail(thumbnail: UIImage?) {
        self.thumbnail.image = thumbnail
    }
    
    func setTitle(title: String) {
        self.title.text = title
    }

    func setChannelName(channelName: String) {
        self.channelName.text = channelName
    }
    
    func setChannelViewCount(viewCount: Int){
        channelViewCount.text = "▶︎ " + Int.getNumWithCommaFormat(number: viewCount)
    }
    
    func setVideoCreateTime(createTime: String){
        videoCreateTime.text = "• " + createTime
    }

}
