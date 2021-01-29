//
//  ViewController.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/25.
//

import UIKit

class MainViewController: UIViewController {

    enum VideoType {
        case original, live
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    private var video : [Video] = []
    private var currentType : VideoType = .original
    private let json = Json()
    private var workItem = DispatchWorkItem() {}
    private var touchBeganTime : TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart.fill"), style: .plain, target: self, action: #selector(clickedFavorite))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(completedJsonParsing),
                    name: NSNotification.Name(rawValue: "jsonParsing"),
                    object: nil)
        
        json.parsing(type: currentType)
        segmentControl.addTarget(self, action: #selector(segconChanged(segCon:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func completedJsonParsing(_ notification:Notification) {
        self.video = notification.userInfo?["video"] as! [Video]
        collectionView.reloadData()
    }
    
    @objc func segconChanged(segCon: UISegmentedControl) {
        switch segCon.selectedSegmentIndex {
        case 0:
            currentType = .original
            json.parsing(type: currentType)
        case 1:
            currentType = .live
            json.parsing(type: currentType)
        default:
            return
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
    
    @objc func clickedFavorite() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchBeganTime = event?.timestamp ?? 0
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEndedTime = event?.timestamp ?? 0
        if touchEndedTime - touchBeganTime >= 1 {
            let touchesCell : CollectionViewCell? = touches.first?.view?.superview?.superview?.findCollectionViewCell()
            let cellData : Video? = touchesCell?.video
            var title = ""; var channelName = ""
            if currentType == .original {
                title = cellData?.clip?.title ?? ""
                channelName = cellData?.channel.name ?? ""
            }
            print(title)
            print(channelName)
        }
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.video.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.isUserInteractionEnabled = true
        if (self.currentType == .original) {
            cell.setOriginalData(video: video[indexPath.row])
        } else {
            cell.setLiveData(video: video[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = self.collectionView.frame.size.width
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            if (UIDevice.current.orientation.isPortrait) {
                width = width / 2 - 10
                return CGSize(width: width, height: width * 0.85)
            } else {
                width = width / 3 - 10
                return CGSize(width: width, height: width * 0.85)
            }
        } else {
            if (UIDevice.current.orientation.isLandscape) {
                width = width / 2 - 10
                return CGSize(width: width, height: width * 0.90)
            }
            return CGSize(width: width, height: width * 0.85)
        }
    }
}
