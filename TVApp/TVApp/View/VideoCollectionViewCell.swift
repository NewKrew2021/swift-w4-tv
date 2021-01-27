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
    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet weak var createTime: UILabel!
    func setThumbnail(thumbnail: UIImage?) {
        self.thumbnail.image = thumbnail
    }
    
    func setTitle(title: String) {
        self.title.text = title
    }
    
    func setChannelName(channelName: String) {
        self.channelName.text = channelName
    }
    
    func setViewCount(viewCount: String) {
        self.viewCount.text = viewCount
    }
    
    func setCreateTime(createTime: String) {
        self.createTime.text = createTime
    }
}
