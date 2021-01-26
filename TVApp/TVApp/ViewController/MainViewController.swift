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
    private var originals : [Original] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        decodeData(type: .original)
    }
    
    func decodeData(type : VideoType) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let originalDataAsset: NSDataAsset = NSDataAsset.init(name: "original") else {return}
        guard let liveDataAsset: NSDataAsset = NSDataAsset.init(name: "live") else {return}

        do {
            if type == .original {
                originals =  try jsonDecoder.decode([Original].self, from: originalDataAsset.data)
            } else if type == .live {
                originals = try jsonDecoder.decode([Original].self, from: liveDataAsset.data)
            }
            collectionView.reloadData()
        } catch let error {
            print("error: ", error)
        }
    }
    
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.originals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setData(original: originals[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 208 166
        let width = self.collectionView.frame.size.width
        return CGSize(width: width, height: width * 0.79)
    }
}
