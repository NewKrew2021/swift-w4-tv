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
        setThumbnailImage(standardView: contentView, padding: 10)
        setDurationOrPlayCount(standardView: thumbnailImage, padding: 8)
        setTitle(standardView: contentView, padding: 10)
        setChannelName(standradView: contentView, padding: 10)
        setChannelVisitCount(standardView: contentView, padding: 10)
        setChannelCreateTime(standardView: contentView, padding: 10)

    }
    
    func addSubviews() {
        contentView.addSubview(thumbnailImage)
        contentView.addSubview(durationOrPlayCount)
        contentView.addSubview(title)
        contentView.addSubview(channelName)
        contentView.addSubview(channelVisitCount)
        contentView.addSubview(channelCreateTime)
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
        self.durationOrPlayCount.text = convertDuration(duration: data.getClipDuration())
        self.title.text = data.getClipTitle()
        self.channelName.text = data.getChannelName()
        self.channelVisitCount.text = convertChannelVisitCountToString(channelVisitCount: data.getVisitCount())
        self.channelCreateTime.text = convertChannelCreateTime(channelCreateTime: data.getCreateTime())
    }
    
    func setLiveData(data : TVLive) {
        thumbnailImage.image = UIImage(named: data.getLiveThumbnailUrl())
        self.durationOrPlayCount.text = "☊ \(data.getLivePlayCount())"
        self.title.text = data.getLiveTitle()
        self.channelName.text = data.getChannelName()
        self.channelVisitCount.text = convertChannelVisitCountToString(channelVisitCount: data.getVisitCount())
        self.channelCreateTime.text = convertChannelCreateTime(channelCreateTime: data.getCreateTime())
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
    
    func convertChannelCreateTime(channelCreateTime : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let frdate : Date = dateFormatter.date(from: channelCreateTime)!
        let todate = Date(timeIntervalSinceNow: 32400)
        let diff = Int(frdate.distance(to: todate))
        
        // 60 3600 86400
        switch diff {
        case 0...60:
            return "• \(diff)초 전"
        case 60...3600:
            return "• \(diff/60)분 전"
        case 3600...86400:
            return "• \(diff/3600)시간 전"
        default:
            return "• \(diff/86400)일 전"
        }
    }
    
    func convertChannelVisitCountToString(channelVisitCount : Int) -> String {
        var resultString = ""
        var count = channelVisitCount
        while count > 0 {
            let num = count % 1000
            count /= 1000
            var tempstr = String(num)
            if resultString.count == 0 {
                if count == 0 {
                    resultString = tempstr
                }
                else {
                    while tempstr.count < 3 {
                        tempstr = "0\(tempstr)"
                    }
                    resultString = tempstr
                }
            } else {
                if count == 0 {
                    resultString = "\(tempstr),\(resultString)"
                }
                else {
                    while tempstr.count < 3 {
                        tempstr = "0\(tempstr)"
                    }
                    resultString = "\(tempstr),\(resultString)"
                }
            }
        }
        return "▶︎ \(resultString)"
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
        title.preferredMaxLayoutWidth = frame.width - 2*padding
        title.lineBreakMode = .byTruncatingTail
        title.numberOfLines = 2
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: padding).isActive = true
        title.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        title.sizeToFit()
    }
    
    func setDurationOrPlayCount(standardView : UIView, padding : CGFloat) {
        durationOrPlayCount.font = UIFont.systemFont(ofSize: 12)
        durationOrPlayCount.backgroundColor = .systemGray
        durationOrPlayCount.textColor = .white
        
        durationOrPlayCount.translatesAutoresizingMaskIntoConstraints = false
        durationOrPlayCount.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        durationOrPlayCount.bottomAnchor.constraint(equalTo: standardView.bottomAnchor, constant: -padding).isActive = true
        durationOrPlayCount.sizeToFit()
    }
    
    func setThumbnailImage(standardView : UIView, padding : CGFloat) {
        thumbnailImage.clipsToBounds = true
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.backgroundColor = .brown
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
        thumbnailImage.leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: -padding).isActive = true
        thumbnailImage.heightAnchor.constraint(equalToConstant: standardView.frame.height * 0.65).isActive = true
    }
}
