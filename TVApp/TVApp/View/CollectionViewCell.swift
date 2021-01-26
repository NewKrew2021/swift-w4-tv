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
    @IBOutlet weak var durationLabel: UILabel!
    
    func setData(original: Original) {
        thumbnailImageView.image = UIImage(named: original.clip?.thumbnailUrl ?? "")
        titleLabel.text = original.clip?.title
        durationLabel.text = conVertDuration(duration: original.clip?.duration ?? 0)
    }
    
    func conVertDuration(duration: Int) -> String {
        var second = String(duration % 60)
        var minute = String((duration / 60) % 60)
        let hour = String(duration / 3600)
        if (second.count == 1) {
            second = "0" + second
        }
        if (minute.count == 1) {
            minute = "0" + minute
        }
        if (hour == "0") {
            return "\(minute):\(second)"
        }
        return "\(hour):\(minute):\(second)"
    }
}
