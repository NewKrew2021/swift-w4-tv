//
//  TVCollectionViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    private var tvImage = UIImageView()
    private var titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setTvImage(standardView: contentView, padding: 10)
        setTitleLabel(standardView: contentView, padding: 10)
    }
    
    func setSubViews() {
        setTvImage(standardView: contentView, padding: 10)
        setTitleLabel(standardView: contentView, padding: 10)
    }
    
    func setTitleLabel(standardView : UIView, padding : CGFloat) {
        addSubview(titleLabel)
        titleLabel.text = "Title"
        titleLabel.layer.borderWidth = 1
        
        titleLabel.backgroundColor = .gray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding*10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true

    }
    
    func setTvImage(standardView : UIView, padding : CGFloat) {
        addSubview(tvImage)
        tvImage.backgroundColor = .gray
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 0).isActive = true
        tvImage.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true
    }
}
