//
//  CollectionViewCell.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/26.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class ProgramCollectionViewCell: UICollectionViewCell {
    static var cellIdentifier = "myProgramCell"
    var tvImage: UIImageView = UIImageView()
    
    private var titleLabel = UILabel()
    private var channelNameLabel = UILabel()
    private var visitCountLabel = UILabel()
    private var createTimeLabel = UILabel()
    private var durationOrPlayCount = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTvImage(standardView: contentView, padding: 1)
        initTitleLabel(standardView: contentView, padding: 1)
        initChannelNameLabel(standardView: contentView, padding: 1)
        initVisitCountLabel(standardView: contentView, padding: 1)
        initCreateTimeLabel(standardView: contentView, padding: 1)
        initDurationOrPlayCount(standardView: contentView, padding: 1)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initTvImage(standardView: contentView, padding: 1)
        initTitleLabel(standardView: contentView, padding: 1)
        initChannelNameLabel(standardView: contentView, padding: 1)
        initVisitCountLabel(standardView: contentView, padding: 1)
        initCreateTimeLabel(standardView: contentView, padding: 1)
        initDurationOrPlayCount(standardView: contentView, padding: 1)
    }
    
    func setSubViews(indexPath: IndexPath, data: JsonParsing, dataTypeIndex: ProgramTypes) {
        switch dataTypeIndex {
        case .Original:
            titleLabel.text = data.originalPrograms[indexPath[1]].clip.title
            tvImage.image = UIImage(named: data.originalPrograms[indexPath[1]].clip.thumbnailURL)
            channelNameLabel.text = data.originalPrograms[indexPath[1]].channel.name
            visitCountLabel.text = "▶︎" + String(data.originalPrograms[indexPath[1]].channel.visitCount)
            durationOrPlayCount.text = convertDuration(duration: data.originalPrograms[indexPath[1]].clip.duration)
            createTimeLabel.text = "•" + convertChannelCreateTime(channelCreateTime: data.originalPrograms[indexPath[1]].channel.createTime)
        default:
            titleLabel.text = data.livePrograms[indexPath[1]].live.title
            tvImage.image = UIImage(named: data.livePrograms[indexPath[1]].live.thumbnailURL)
            channelNameLabel.text = data.livePrograms[indexPath[1]].channel.name
            visitCountLabel.text = "▶︎" + String(data.livePrograms[indexPath[1]].channel.visitCount)
            durationOrPlayCount.text = "☊ \(data.livePrograms[indexPath[1]].live.playCount)"
            createTimeLabel.text = "•" + convertChannelCreateTime(channelCreateTime: data.livePrograms[indexPath[1]].channel.createTime)
        }
    }
    
    func convertDuration(duration : Int) -> String{
        let H = duration/3600
        let M = duration%3600/60
        let S = duration%60
        let strH = String(H)
        let strM = M >= 10 ? String(M) : "0\(String(M))"
        let strS = S >= 10 ? String(S) : "0\(String(S))"
        if H > 0 {
            return "\(strH):\(strM):\(strS)"
        } else {
            return "\(strM):\(strS)"
        }
    }
    
    func initTvImage(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(tvImage)
        tvImage.backgroundColor = .white
        tvImage.clipsToBounds = true
        tvImage.contentMode = .scaleToFill
        tvImage.backgroundColor = .brown
        tvImage.translatesAutoresizingMaskIntoConstraints = false
        tvImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        tvImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        tvImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        tvImage.heightAnchor.constraint(equalToConstant: standardView.frame.height * 0.65).isActive = true
        tvImage.sizeToFit()
    }
    
    func initTitleLabel(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(titleLabel)
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
        standardView.addSubview(channelNameLabel)
        channelNameLabel.font = UIFont.systemFont(ofSize: 15)
        channelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        channelNameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: padding).isActive = true
        channelNameLabel.sizeToFit()
    }
    
    func initVisitCountLabel(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(visitCountLabel)
        visitCountLabel.font = UIFont.systemFont(ofSize: 15)
        visitCountLabel.translatesAutoresizingMaskIntoConstraints = false
        visitCountLabel.topAnchor.constraint(equalTo: channelNameLabel.topAnchor).isActive = true
        visitCountLabel.leadingAnchor.constraint(equalTo: channelNameLabel.trailingAnchor, constant: padding * 10).isActive = true
        visitCountLabel.sizeToFit()
    }
    
    func initCreateTimeLabel(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(createTimeLabel)
        createTimeLabel.font = UIFont.systemFont(ofSize: 15)
        createTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        createTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        createTimeLabel.leadingAnchor.constraint(equalTo: visitCountLabel.trailingAnchor, constant: padding * 10).isActive = true
        createTimeLabel.sizeToFit()
    }
    
    func initDurationOrPlayCount(standardView : UIView, padding : CGFloat) {
        standardView.addSubview(durationOrPlayCount)
        durationOrPlayCount.font = UIFont.systemFont(ofSize: 12)
        durationOrPlayCount.backgroundColor = .systemGray
        durationOrPlayCount.textColor = .white
        
        durationOrPlayCount.translatesAutoresizingMaskIntoConstraints = false
        durationOrPlayCount.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding * 8).isActive = true
        durationOrPlayCount.bottomAnchor.constraint(equalTo: tvImage.bottomAnchor, constant: -padding * 8).isActive = true
        durationOrPlayCount.sizeToFit()
    }
    
    
    func convertChannelCreateTime(channelCreateTime : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let frdate : Date = dateFormatter.date(from: channelCreateTime)!
        let todate = Date(timeIntervalSinceNow: 32400)
        let diff = Int(frdate.distance(to: todate))
        
        switch diff {
        case 0...60:
            return " \(diff)초 전"
        case 60...3600:
            return " \(diff/60)분 전"
        case 3600...86400:
            return " \(diff/3600)시간 전"
        default:
            return " \(diff/86400)일 전"
        }
    }
}
