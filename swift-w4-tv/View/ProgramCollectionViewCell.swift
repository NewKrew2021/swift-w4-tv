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
    
    
    var tvImage: UIImageView = UIImageView()
    
    private var titleLabel = UILabel()
    private var channelNameLabel = UILabel()
    private var visitCountLabel = UILabel()
    private var createTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    func setSubViews(indexPath: IndexPath, data: JsonParsing, dataTypeIndex: Int) {
        switch dataTypeIndex {
        case 0:
            titleLabel.text = data.originalPrograms[indexPath[1]].clip.title
            tvImage.image = UIImage(named: data.originalPrograms[indexPath[1]].clip.thumbnailURL)
            channelNameLabel.text = data.originalPrograms[indexPath[1]].channel.name
            visitCountLabel.text = "▶︎" + String(data.originalPrograms[indexPath[1]].channel.visitCount)
            createTimeLabel.text = "•" + data.originalPrograms[indexPath[1]].channel.createTime
        default:
            titleLabel.text = data.livePrograms[indexPath[1]].live.title
            tvImage.image = UIImage(named: data.livePrograms[indexPath[1]].live.thumbnailURL)
            channelNameLabel.text = data.livePrograms[indexPath[1]].channel.name
            visitCountLabel.text = "▶︎" + String(data.livePrograms[indexPath[1]].channel.visitCount)
            createTimeLabel.text = "•" + data.livePrograms[indexPath[1]].channel.createTime
        }
        
    }
    
    func initTvImage(standardView : UIView, padding : CGFloat) {
        self.addSubview(tvImage)
        tvImage.backgroundColor = .white
        tvImage.clipsToBounds = true
        tvImage.contentMode = .scaleAspectFill
        tvImage.backgroundColor = .brown
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        tvImage.heightAnchor.constraint(equalToConstant: standardView.frame.height * 0.65).isActive = true
    }
    
    func initTitleLabel(standardView : UIView, padding : CGFloat) {
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.preferredMaxLayoutWidth = frame.width
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: tvImage.bottomAnchor, constant: padding).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        titleLabel.sizeToFit()
    }
    
    func initChannelNameLabel(standardView : UIView, padding : CGFloat) {
        contentView.addSubview(channelNameLabel)
        channelNameLabel.font = UIFont.systemFont(ofSize: 15)
        channelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        channelNameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: padding).isActive = true
        channelNameLabel.sizeToFit()
    }
    
    func initVisitCountLabel(standardView : UIView, padding : CGFloat) {
        contentView.addSubview(visitCountLabel)
        visitCountLabel.font = UIFont.systemFont(ofSize: 15)
        visitCountLabel.translatesAutoresizingMaskIntoConstraints = false
        visitCountLabel.topAnchor.constraint(equalTo: channelNameLabel.topAnchor).isActive = true
        visitCountLabel.leadingAnchor.constraint(equalTo: channelNameLabel.trailingAnchor, constant: padding * 10).isActive = true
        visitCountLabel.sizeToFit()
    }
    
    func initCreateTimeLabel(standardView : UIView, padding : CGFloat) {
        addSubview(createTimeLabel)
        createTimeLabel.font = UIFont.systemFont(ofSize: 15)
        createTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        createTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        createTimeLabel.leadingAnchor.constraint(equalTo: visitCountLabel.trailingAnchor, constant: padding * 10).isActive = true
        createTimeLabel.sizeToFit()
    }
}
