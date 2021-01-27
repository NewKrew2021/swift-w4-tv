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
    @IBOutlet weak var durationLabel: DurationUILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    
    func setOriginalData(video: Video) {
        thumbnailImageView.image = UIImage(named: video.clip?.thumbnailUrl ?? "")
        titleLabel.text = video.clip?.title
        durationLabel.setTextAndFixSize(text: convertDuration(duration: video.clip?.duration ?? 0))
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convertVisitCount(visitCount: video.channel.visitCount))  • \(convertCreateTime(createTime: video.createTime))"
    }
    
    func setLiveData(video: Video) {
        thumbnailImageView.image = UIImage(named: video.live?.thumbnailUrl ?? "")
        titleLabel.text = video.live?.title
        durationLabel.setTextAndFixSize(text: "🎧\(video.live?.playCount ?? 0)")
        subInfoLabel.text = "\(video.channel.name)  ▶︎ \(convertVisitCount(visitCount: video.channel.visitCount))  • \(convertCreateTime(createTime: video.live!.createTime))"
    }
    
    func convertDuration(duration: Int) -> String {
        var second = String(duration % 60)
        var minute = String((duration / 60) % 60)
        let hour = String(duration / 3600)
        if (second.count == 1) {
            second = "0" + second
        }
        if (minute.count == 1) {
            minute = "0" + minute
        }
        if (hour == "0") {
            return "\(minute):\(second)"
        }
        return "\(hour):\(minute):\(second)"
    }
    
    func convertVisitCount(visitCount: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: visitCount))!
        
        return result
    }
    
    func convertCreateTime(createTime: String) -> String {
        let date = stringToDate(dateString: createTime)
        let currentDate = Date()
        let diffComponents = Calendar.current.dateComponents([.second, .minute, .hour, .day], from: date, to: currentDate)
        if (diffComponents.day != 0) {
            return "\(diffComponents.day ?? 0)일 전"
        } else if (diffComponents.hour != 0) {
            return "\(diffComponents.hour ?? 0)시간 전"
        } else if (diffComponents.minute != 0) {
            return "\(diffComponents.minute ?? 0)분 전"
        } else {
            return "\(diffComponents.second ?? 0)초 전"
        }
    }
    
    func stringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date:Date = dateFormatter.date(from: dateString)!
        return date
    }
}
