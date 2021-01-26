//
//  TVCollectionViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    private var thumbnailImage = UIImageView()
    private var durationOrPlayCount = UILabel()
    private var title = UILabel(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
    private var channelName = UILabel()
    private var channelVisitCount = UILabel()
    private var channelCreateTime = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setSubViews()
    }
    
    func setSubViews() {
        setThumbnailImage(standardView: contentView, padding: 10)
        setDurationOrPlayCount(standardView: thumbnailImage, padding: 10)
        setTitle(standardView: contentView, padding: 10)
        setChannelName(standradView: contentView, padding: 10)
        setChannelVisitCount(standardView: contentView, padding: 10)
        setChannelCreateTime(standardView: contentView, padding: 10)
    }
    
    func setCellData(thumbnailImageName : String, durationOrPlayCount : Int, title : String, channelName : String, channelVisitCount : String, channelCreateTime : String) {
        
    }
    
    func setDurationOrPlayCount(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(durationOrPlayCount)
        durationOrPlayCount.font = UIFont.systemFont(ofSize: 12)
        durationOrPlayCount.text = "28:22"
        durationOrPlayCount.backgroundColor = .systemGray
        
        durationOrPlayCount.translatesAutoresizingMaskIntoConstraints = false
        durationOrPlayCount.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        durationOrPlayCount.bottomAnchor.constraint(equalTo: standardView.bottomAnchor, constant: -padding).isActive = true
        durationOrPlayCount.sizeToFit()
    }
    
    func setChannelCreateTime(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(channelCreateTime)
        channelCreateTime.font = UIFont.systemFont(ofSize: 15)
        channelCreateTime.text = "・42분전"
        
        channelCreateTime.translatesAutoresizingMaskIntoConstraints = false
        channelCreateTime.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelCreateTime.leadingAnchor.constraint(equalTo: channelVisitCount.trailingAnchor, constant: padding).isActive = true
        channelCreateTime.sizeToFit()
    }
    
    func setChannelVisitCount(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(channelVisitCount)
        channelVisitCount.font = UIFont.systemFont(ofSize: 15)
        channelVisitCount.text = "▶︎123,456,789"
        
        channelVisitCount.translatesAutoresizingMaskIntoConstraints = false
        channelVisitCount.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelVisitCount.leadingAnchor.constraint(equalTo: channelName.trailingAnchor, constant: padding).isActive = true
        channelVisitCount.sizeToFit()
    }
    
    func setChannelName(standradView : UIView, padding : CGFloat) {
        standradView.addSubview(channelName)
        channelName.font = UIFont.systemFont(ofSize: 15)
        channelName.text = "Channel Name"
        
        channelName.translatesAutoresizingMaskIntoConstraints = false
        channelName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: padding).isActive = true
        channelName.leadingAnchor.constraint(equalTo: standradView.leadingAnchor, constant: padding).isActive = true
        channelName.sizeToFit()
    }
    
    func setTitle(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(title)
        title.text = "Title"
        title.layer.borderWidth = 1
        
        title.backgroundColor = .gray
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: padding).isActive = true
        title.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        title.sizeToFit()

    }
    
    func setThumbnailImage(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(thumbnailImage)
        thumbnailImage.backgroundColor = .gray
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        thumbnailImage.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true
    }
}
