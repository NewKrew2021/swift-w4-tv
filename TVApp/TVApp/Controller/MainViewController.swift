//
//  ViewController.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/25.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var videoTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    let videoManager = VideoManager.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
//        originals[0].getFormattedCreateTime()
    }
    
    func initView() {
        self.videoCollectionView.delegate = self
        self.videoCollectionView.dataSource = self
        
        videoTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        videoTypeSegmentControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoManager.originalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
        guard let videoCell = cell as? VideoCollectionViewCell else {return cell}
        if let original = videoManager.getOriginalContent(at: indexPath.item){
            setOriginalCell(target: videoCell, by: original)
        }
//        videoCell.setThumbnail(thumbnail: UIImage(named: original.clip.thumbnailUrl))
//        videoCell.title.sizeToFit()
//        videoCell.setTitle(title: original.displayTitle)
//        videoCell.setChannelName(channelName: original.channel.name)
//        videoCell.setChannelViewCount(viewCount: original.channel.visitCount)
//        videoCell.setVideoCreateTime(createTime: original.clip.createTime)
        return videoCell
    }
    
    func setOriginalCell(target: VideoCollectionViewCell, by: Video) {
        let viewCount = "▶︎ \(Convert.getStringNumToCommaFormat(number: by.channel.visitCount))"
        let creatTime = "• \(Convert.getDistFromCurrentTime(time: by.createTime))"
        var thumbnail: UIImage?
        if let thumbnailUrl = by.clip?.thumbnailUrl {
            thumbnail = UIImage(named: thumbnailUrl)
        }
        target.setTitle(title: by.displayTitle)
        target.setThumbnail(thumbnail: thumbnail)
        target.setChannelName(channelName: by.channel.name)
        target.setViewCount(viewCount: viewCount)
        target.setCreateTime(createTime: creatTime)
    }
    
    func setLiveCell(target: VideoCollectionViewCell, by: Video) {
        var viewCount = ""
        let creatTime = "• \(Convert.getDistFromCurrentTime(time: by.createTime))"
        var thumbnail: UIImage?
        if let live = by.live {
            viewCount = "▶︎ \(Convert.getStringNumToCommaFormat(number: live.playCount))"
            thumbnail = UIImage(named: live.thumbnailUrl)
        }
        target.setTitle(title: by.displayTitle)
        target.setChannelName(channelName: by.channel.name)
        target.setCreateTime(createTime: creatTime)
        target.setThumbnail(thumbnail: thumbnail)
        target.setViewCount(viewCount: viewCount)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        var size: CGSize
        if isPad() {
            width = (collectionView.frame.width - 20)/2.1
            height = collectionView.frame.height/3
            size = CGSize(width: width, height: height)
        }
        else{
            width = collectionView.frame.width - 20
            height = collectionView.frame.height/2
            size = CGSize(width: width, height: height)
        }
        return size
    }
    
    func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad ? true : false
    }
}
