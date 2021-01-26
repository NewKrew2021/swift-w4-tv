//
//  TVCollectionViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    private var tvImage = UIImageView()
    private var nameLabel = UILabel(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        setTvImage(standardView: contentView, padding: 10)
        setTitleLabel(standardView: contentView, padding: 10)
    }
    
    func setSubViews() {
    }
    
    func setTitleLabel(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(nameLabel)
        nameLabel.text = "Title"
        nameLabel.layer.borderWidth = 1
        
        nameLabel.backgroundColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: tvImage.bottomAnchor, constant: padding).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        nameLabel.sizeToFit()

    }
    
    func setTvImage(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(tvImage)
        tvImage.backgroundColor = .gray
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        tvImage.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true
    }
}
