//
//  TVCollectionViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    
    private var thumbnailView = UIView()
    private var thumbnailImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    private var durationOrPlayCount = UILabel()
    private var title = UILabel()
    private var channelName = UILabel()
    private var channelVisitCount = UILabel()
    private var channelCreateTime = UILabel()
    private var clipOrLiveId = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setSubViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setSubViews()
    }

    func setSubViews() {
        self.layer.borderWidth = 3
        setThumbnailImage(standardView: contentView, padding: 10)
        setDurationOrPlayCount(standardView: thumbnailImage)
        setTitle(standardView: contentView, padding: 10)
        setChannelName(standradView: contentView, padding: 10)
        setChannelVisitCount(standardView: contentView, padding: 10)
        setChannelCreateTime(standardView: contentView, padding: 10)
        setClipOrLiveId()
    }
    
    func addSubviews() {
        contentView.addSubview(thumbnailImage)
        contentView.addSubview(durationOrPlayCount)
        contentView.addSubview(title)
        contentView.addSubview(channelName)
        contentView.addSubview(channelVisitCount)
        contentView.addSubview(channelCreateTime)
        contentView.addSubview(clipOrLiveId)
    }
    
    func setCellData(segmentIndex : Int, dataIn : Any) {
        if segmentIndex == 0 {
            setOriginalData(data: dataIn as! TVOriginal)
            return
        } else {
            setLiveData(data: dataIn as! TVLive)
            return
        }
    }
    
    func setOriginalData(data : TVOriginal) {
        thumbnailImage.image = UIImage(named: data.getClipThumbnailUrl())
        self.durationOrPlayCount.text = MyConverter.convertDuration(duration: data.getClipDuration())
        self.title.text = data.getClipTitle()
        self.channelName.text = data.getChannelName()
        self.channelVisitCount.text = MyConverter.convertChannelVisitCountToString(channelVisitCount: data.getVisitCount())
        self.channelCreateTime.text = MyConverter.convertChannelCreateTime(channelCreateTime: data.getCreateTime())
        self.clipOrLiveId.text = String(data.getIClipId())
    }
    
    func setLiveData(data : TVLive) {
        thumbnailImage.image = UIImage(named: data.getLiveThumbnailUrl())
        self.durationOrPlayCount.text = "☊ \(data.getLivePlayCount())"
        self.title.text = data.getLiveTitle()
        self.channelName.text = data.getChannelName()
        self.channelVisitCount.text = MyConverter.convertChannelVisitCountToString(channelVisitCount: data.getVisitCount())
        self.channelCreateTime.text = MyConverter.convertChannelCreateTime(channelCreateTime: data.getCreateTime())
        self.clipOrLiveId.text = String(data.getLiveId())
    }
    
    func setClipOrLiveId() {
        clipOrLiveId.isHidden = true
    }
    
    func setChannelCreateTime(standardView : UIView, padding : CGFloat) {
        channelCreateTime.font = UIFont.systemFont(ofSize: 15)
        
        channelCreateTime.translatesAutoresizingMaskIntoConstraints = false
        channelCreateTime.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelCreateTime.leadingAnchor.constraint(equalTo: channelVisitCount.trailingAnchor, constant: padding).isActive = true
        channelCreateTime.trailingAnchor.constraint(lessThanOrEqualTo: standardView.trailingAnchor, constant: -padding).isActive = true
        channelCreateTime.lineBreakMode = .byTruncatingTail
        channelCreateTime.sizeToFit()
    }
    
    func setChannelVisitCount(standardView : UIView, padding : CGFloat) {
        channelVisitCount.font = UIFont.systemFont(ofSize: 15)
        
        channelVisitCount.translatesAutoresizingMaskIntoConstraints = false
        channelVisitCount.topAnchor.constraint(equalTo: channelName.topAnchor).isActive = true
        channelVisitCount.leadingAnchor.constraint(equalTo: channelName.trailingAnchor, constant: padding).isActive = true
        channelVisitCount.sizeToFit()
    }
    
    func setChannelName(standradView : UIView, padding : CGFloat) {
        channelName.font = UIFont.systemFont(ofSize: 15)
        
        channelName.translatesAutoresizingMaskIntoConstraints = false
        channelName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: padding).isActive = true
        channelName.leadingAnchor.constraint(equalTo: standradView.leadingAnchor, constant: padding).isActive = true
        channelName.sizeToFit()
    }
    
    func setTitle(standardView : UIView, padding : CGFloat) {
//        title.preferredMaxLayoutWidth = frame.width - 4*padding
        title.lineBreakMode = .byTruncatingTail
        title.numberOfLines = 2
        title.font = UIFont.systemFont(ofSize: 17)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: padding).isActive = true
        title.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        title.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        title.sizeToFit()
    }
    
    func setDurationOrPlayCount(standardView : UIView) {
        durationOrPlayCount.font = UIFont.systemFont(ofSize: 12)
        durationOrPlayCount.backgroundColor = .systemGray
        durationOrPlayCount.textColor = .white
        
        durationOrPlayCount.translatesAutoresizingMaskIntoConstraints = false
        durationOrPlayCount.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -8).isActive = true
        durationOrPlayCount.bottomAnchor.constraint(equalTo: standardView.bottomAnchor, constant: -8).isActive = true
        durationOrPlayCount.sizeToFit()
    }
    
    func setThumbnailImage(standardView : UIView, padding : CGFloat) {
        thumbnailImage.clipsToBounds = true
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.backgroundColor = .brown
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        thumbnailImage.centerXAnchor.constraint(equalTo: standardView.centerXAnchor).isActive = true
//        thumbnailImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
//        thumbnailImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        thumbnailImage.heightAnchor.constraint(equalTo: thumbnailImage.widthAnchor, multiplier: 15/28).isActive = true
//        thumbnailImage.heightAnchor.constraint(equalToConstant: standardView.frame.height * 0.65).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
    }
}
