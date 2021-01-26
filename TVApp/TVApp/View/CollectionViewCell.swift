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
    
    func setData(original: Original) {
        thumbnailImageView.image = UIImage(named: original.clip?.thumbnailUrl ?? "")
        titleLabel.text = original.clip?.title
    }
}
