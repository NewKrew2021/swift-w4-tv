//
//  TVCollectionViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    private var cellInnerView = UIView()
    private var thumbnailView = UIView()
    private var thumbnailImage = UIImageView()
    private var durationOrPlayCount = UILabel()
    private var title = UILabel()
    private var channelName = UILabel()
    private var channelVisitCount = UILabel()
    private var channelCreateTime = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setSubViews()
    }

    func setSubViews() {
        setCellInnerView(standardView : contentView, padding : 10)
        setThumbnailImage(standardView: contentView, padding: 10)
        setDurationOrPlayCount(standardView: thumbnailImage, padding: 10)
        setTitle(standardView: contentView, padding: 10)
        setChannelName(standradView: contentView, padding: 10)
        setChannelVisitCount(standardView: contentView, padding: 10)
        setChannelCreateTime(standardView: contentView, padding: 10)
    }
    
    func setCellInnerView(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(cellInnerView)
        cellInnerView.translatesAutoresizingMaskIntoConstraints = false
        cellInnerView.leadingAnchor.constraint(equalTo: standardView.leadingAnchor).isActive = true
    }

    func setCellData(thumbnailImageName : String, durationOrPlayCount : Int, title : String, channelName : String, channelVisitCount : Int, channelCreateTime : String) {
//        thumbnailImage.image = UIImage(named: thumbnailImageName)
        self.durationOrPlayCount.text = String(durationOrPlayCount)
        self.title.text = title
        self.channelName.text = channelName
        self.channelVisitCount.text = String(channelVisitCount)
        self.channelCreateTime.text = channelCreateTime
    }
    
    func setChannelCreateTime(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(channelCreateTime)
        channelCreateTime.font = UIFont.systemFont(ofSize: 15)
        
        channelCreateTime.translatesAutoresizingMaskIntoConstraints = false
        channelCreateTime.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelCreateTime.leadingAnchor.constraint(equalTo: channelVisitCount.trailingAnchor, constant: padding).isActive = true
        channelCreateTime.trailingAnchor.constraint(lessThanOrEqualTo: standardView.trailingAnchor, constant: -padding).isActive = true
        channelCreateTime.lineBreakMode = .byTruncatingTail
        channelCreateTime.sizeToFit()
    }
    
    func setChannelVisitCount(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(channelVisitCount)
        channelVisitCount.font = UIFont.systemFont(ofSize: 15)
        
        channelVisitCount.translatesAutoresizingMaskIntoConstraints = false
        channelVisitCount.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelVisitCount.leadingAnchor.constraint(equalTo: channelName.trailingAnchor, constant: padding).isActive = true
        channelVisitCount.sizeToFit()
    }
    
    func setChannelName(standradView : UIView, padding : CGFloat) {
        standradView.addSubview(channelName)
        channelName.font = UIFont.systemFont(ofSize: 15)
        
        channelName.translatesAutoresizingMaskIntoConstraints = false
        channelName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: padding).isActive = true
        channelName.leadingAnchor.constraint(equalTo: standradView.leadingAnchor, constant: padding).isActive = true
        channelName.sizeToFit()
    }
    
    func setTitle(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(title)
        title.preferredMaxLayoutWidth = frame.width - 2*padding
        title.lineBreakMode = .byTruncatingTail
        title.numberOfLines = 2
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: padding).isActive = true
        title.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        title.sizeToFit()
//        title.heightAnchor.constraint(equalToConstant: 10).isActive = true
//        title.trailingAnchor.constraint(equalTo: standardView.trailingAnchor).isActive = true
//        title.trailingAnchor.constraint(lessThanOrEqualTo: standardView.trailingAnchor).isActive = true
//        title.widthAnchor.constraint(lessThanOrEqualTo: standardView.widthAnchor, constant: -2 * padding).isActive = true
    }
    
    func setDurationOrPlayCount(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(durationOrPlayCount)
        durationOrPlayCount.font = UIFont.systemFont(ofSize: 12)
        durationOrPlayCount.backgroundColor = .systemGray
        
        durationOrPlayCount.translatesAutoresizingMaskIntoConstraints = false
        durationOrPlayCount.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        durationOrPlayCount.bottomAnchor.constraint(equalTo: standardView.bottomAnchor, constant: -padding).isActive = true
        durationOrPlayCount.sizeToFit()
    }
    
    func setThumbnailImage(standardView : UIView, padding : CGFloat) {

//        standardView.addSubview(thumbnailImage)
//        thumbnailImage.clipsToBounds = true
//        thumbnailImage.contentMode = .scaleAspectFill
//        thumbnailImage.backgroundColor = .brown
//        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
//        thumbnailImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
//        thumbnailImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
//        thumbnailImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
//        thumbnailImage.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true


        standardView.addSubview(thumbnailView)
        thumbnailView.backgroundColor = .gray
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailView.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        thumbnailView.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
//        thumbnailView.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        thumbnailView.widthAnchor.constraint(equalTo: standardView.widthAnchor, constant: -2 * padding).isActive = true
        thumbnailView.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true

        
        thumbnailView.addSubview(thumbnailImage)
        thumbnailImage.clipsToBounds = true
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.backgroundColor = .brown
        
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.topAnchor.constraint(equalTo: thumbnailView.topAnchor).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: thumbnailView.leadingAnchor).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: thumbnailView.trailingAnchor).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: thumbnailView.bottomAnchor).isActive = true
        thumbnailImage.heightAnchor.constraint(equalTo: thumbnailView.heightAnchor).isActive = true

    }
}
