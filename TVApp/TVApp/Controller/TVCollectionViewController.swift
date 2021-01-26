//
//  TVCollectionViewController.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewController: UIViewController {
    private let originalData = OriginalData.shared
    private let liveData = LiveData.shared

    @IBOutlet weak var TVCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        TVCollectionView.delegate = self
        TVCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TVCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        originalData.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVCell", for: indexPath) as! TVCollectionViewCell
        // Configure the cell
        cell.layer.borderWidth = 1
        let cellData = originalData.getData(index: indexPath.row)
        cell.setCellData(thumbnailImageName: cellData.getClipThumbnailUrl(), durationOrPlayCount: cellData.getClipDuration(), title: cellData.getClipTitle(), channelName: cellData.getChannelName(), channelVisitCount: cellData.getVisitCount(), channelCreateTime: cellData.getCreateTime())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width * 0.9, height: height / 2)
    }
    
}
