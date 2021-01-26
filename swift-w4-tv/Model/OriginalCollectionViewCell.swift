//
//  CollectionViewCell.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/26.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class OriginalCollectionViewCell: UICollectionViewCell {
    static var cellIdentifier = "myOriginalCell"
    
    private var tvImage = UIImageView()
    private var titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    
    private var channelNameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    private var visitCountLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    private var createTimeLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        initTvImage(standardView: contentView, padding: 1)
        initTitleLabel(standardView: contentView, padding: 1)
        initChannelNameLabel(standardView: contentView, padding: 1)
        initVisitCountLabel(standardView: contentView, padding: 1)
        initCreateTimeLabel(standardView: contentView, padding: 1)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initTvImage(standardView: contentView, padding: 1)
        initTitleLabel(standardView: contentView, padding: 1)
        initChannelNameLabel(standardView: contentView, padding: 1)
        initVisitCountLabel(standardView: contentView, padding: 1)
        initCreateTimeLabel(standardView: contentView, padding: 1)
    }
    
    func setSubViews(indexPath: IndexPath, data: JsonParsing) {
        setProgramView(indexPath: indexPath, data: data, standardView: contentView, padding: 1)
    }
    
    
    func initTvImage(standardView : UIView, padding : CGFloat) {
        addSubview(tvImage)
        tvImage.backgroundColor = .white
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 0).isActive = true
        tvImage.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    func initTitleLabel(standardView : UIView, padding : CGFloat) {
        addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = "Title"
        titleLabel.layer.borderWidth = 1
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: tvImage.bottomAnchor, constant: 1).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.17).isActive = true
    }
    
    func initChannelNameLabel(standardView : UIView, padding : CGFloat) {
        addSubview(channelNameLabel)
        channelNameLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        channelNameLabel.text = "channelName"
        channelNameLabel.layer.borderWidth = 1
        channelNameLabel.numberOfLines = 2
        channelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        channelNameLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        channelNameLabel.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        channelNameLabel.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func initVisitCountLabel(standardView : UIView, padding : CGFloat) {
        addSubview(visitCountLabel)
        visitCountLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        visitCountLabel.text = "visitCountLabel"
        visitCountLabel.layer.borderWidth = 1
        visitCountLabel.numberOfLines = 2
        visitCountLabel.translatesAutoresizingMaskIntoConstraints = false
        visitCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        visitCountLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding * 100).isActive = true
        visitCountLabel.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        visitCountLabel.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func initCreateTimeLabel(standardView : UIView, padding : CGFloat) {
        addSubview(createTimeLabel)
        createTimeLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        createTimeLabel.text = "createTimeLabel"
        createTimeLabel.layer.borderWidth = 1
        createTimeLabel.numberOfLines = 2
        createTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        createTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        createTimeLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding * 200).isActive = true
        createTimeLabel.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        createTimeLabel.heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setProgramView(indexPath: IndexPath, data: JsonParsing, standardView : UIView, padding : CGFloat) {
        titleLabel.text = data.originalPrograms[indexPath[1]].clip.title
        tvImage.image = UIImage(named: data.originalPrograms[indexPath[1]].clip.thumbnailURL)
        channelNameLabel.text = data.originalPrograms[indexPath[1]].channel.name
        visitCountLabel.text = "▶︎" + String(data.originalPrograms[indexPath[1]].channel.visitCount)
        createTimeLabel.text = "•" + data.originalPrograms[indexPath[1]].channel.createTime
        
    }
}
