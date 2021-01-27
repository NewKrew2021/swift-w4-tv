//
//  TVCollectionViewController.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/25.
//

import UIKit

class TVCollectionViewController: UIViewController {
    private let originalData = OriginalData()
    private let liveData = LiveData()
    private var segmentIndex = 0
    private var cellwidth = CGFloat()
    private var cellheight = CGFloat()
    private var cellcount = 0

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var TVCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        overrideUserInterfaceStyle = .dark
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: nil), animated: true)
        
        guard let layout = TVCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.estimatedItemSize = .zero
        
        let width = TVCollectionView.frame.width
        print(width)
        cellwidth = 350
        cellheight = cellwidth * 0.8
//        if width < 400 {
//            cellwidth = 350
//            cellheight = cellwidth * 0.8
//        }
        cellcount = segmentIndex == 0 ? originalData.count() : liveData.count()

        TVCollectionView.delegate = self
        TVCollectionView.dataSource = self
    }

    @IBAction func segmentControlChanged(_ sender: Any) {
        segmentIndex = segmentControl.selectedSegmentIndex
        cellcount = segmentIndex == 0 ? originalData.count() : liveData.count()
        TVCollectionView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(size)
    }
}

extension TVCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellcount
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
//        let width = collectionView.frame.width
//        let height = collectionView.frame.height
//        return CGSize(width: width * 0.9, height: height * 0.50)
        return CGSize(width: cellwidth, height: cellheight)
    }
    
}

