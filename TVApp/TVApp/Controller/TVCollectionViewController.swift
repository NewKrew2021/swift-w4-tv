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
    private var segmentIndex = 0

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var TVCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        overrideUserInterfaceStyle = .dark
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: nil), animated: true)
        
        TVCollectionView.delegate = self
        TVCollectionView.dataSource = self
    }

    @IBAction func segmentControlChanged(_ sender: Any) {
        segmentIndex = segmentControl.selectedSegmentIndex
        TVCollectionView.reloadData()
    }
}

extension TVCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        segmentIndex == 0 ? originalData.count() : liveData.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVCell", for: indexPath) as! TVCollectionViewCell
        // Configure the cell
        cell.layer.borderWidth = 1
        let cellData : Any = segmentIndex == 0 ? originalData.getData(index: indexPath.row) : liveData.getData(index: indexPath.row)
        cell.setCellData(segmentIndex: segmentIndex, dataIn: cellData)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width * 0.9, height: height * 0.50)
    }
    
}
