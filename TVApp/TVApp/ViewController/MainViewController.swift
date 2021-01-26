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
    private var originals : [Video] = []
    private var currentType : VideoType = .original
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        loadData(type: currentType)
        segmentControl.addTarget(self, action: #selector(segconChanged(segCon:)), for: UIControl.Event.valueChanged)
    }
    
    func loadData(type : VideoType) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let originalDataAsset: NSDataAsset = NSDataAsset.init(name: "original") else {return}
        guard let liveDataAsset: NSDataAsset = NSDataAsset.init(name: "live") else {return}

        do {
            if type == .original {
                originals =  try jsonDecoder.decode([Video].self, from: originalDataAsset.data)
            } else if type == .live {
                originals = try jsonDecoder.decode([Video].self, from: liveDataAsset.data)
            }
            collectionView.reloadData()
        } catch let error {
            print("error: ", error)
        }
    }
    
    @objc func segconChanged(segCon: UISegmentedControl) {
        switch segCon.selectedSegmentIndex {
        case 0:
            currentType = .original
            loadData(type: currentType)
        case 1:
            currentType = .live
            loadData(type: currentType)
        default:
            return
        }
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.originals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        if (self.currentType == .original) {
            cell.setOriginalData(video: originals[indexPath.row])
        } else {
            cell.setLiveData(video: originals[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.size.width
        return CGSize(width: width, height: width * 0.85)
    }
}
