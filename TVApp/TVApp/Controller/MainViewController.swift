//
//  ViewController.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var videoTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var originals: [OriginalCell] = []
    var lives: [LiveCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getJSON(from: "original")
    }
    
    func initView() {
        self.videoCollectionView.delegate = self
        self.videoCollectionView.dataSource = self
        
        videoTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        videoTypeSegmentControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
    }

    func getJSON(from: String) {
        let decoder = JSONDecoder()
        guard let json = NSDataAsset(name: from) else {return}
        
        switch from {
        case "live":
            do {
                lives = try decoder.decode([LiveCell].self, from: json.data)
            }
            catch {
                print(error.localizedDescription)
            }
        case "original":
            do {
                originals = try decoder.decode([OriginalCell].self, from: json.data)
            }
            catch {
                print(error.localizedDescription)
            }
        default:
            return
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return originals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
        guard let videoCell = cell as? VideoCollectionViewCell else {return cell}
        let original = originals[indexPath.item]
        videoCell.setThumbnail(thumbnail: UIImage(named: original.clip.thumbnailUrl))
        videoCell.title.sizeToFit()
        videoCell.setTitle(title: original.displayTitle)
        videoCell.setChannelName(channelName: original.channel.name)
        videoCell.setChannelViewCount(viewCount: original.channel.visitCount)
        videoCell.setVideoCreateTime(createTime: original.clip.createTime)
        return videoCell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        let height = collectionView.frame.height/2

        let size = CGSize(width: width, height: height)
        return size
    }
}
