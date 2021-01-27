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
    private var flag = false

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var TVCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        overrideUserInterfaceStyle = .dark
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: nil), animated: true)
        
        guard let layout = TVCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.estimatedItemSize = .zero
        
        calculateWidth()
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
        flag = !flag
        TVCollectionView.reloadData()
    }


}

extension TVCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellcount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVCell", for: indexPath) as! TVCollectionViewCell
        let cellData : Any = segmentIndex == 0 ? originalData.getData(index: indexPath.row) : liveData.getData(index: indexPath.row)
        cell.setCellData(segmentIndex: segmentIndex, dataIn: cellData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if flag {
            calculateWidth()
            cellheight = cellwidth * 0.8
            flag = !flag
        }
        return CGSize(width: cellwidth, height: cellheight)
    }
    
    func calculateWidth(){
        switch (UIDevice.current.userInterfaceIdiom, UIDevice.current.orientation) {
        case (.phone, UIDeviceOrientation.portrait):
            cellwidth = UIScreen.main.bounds.width - 60
        case (.phone, .landscapeLeft):
            cellwidth = UIScreen.main.bounds.width/2 - 60
        case (.phone, .landscapeRight):
            cellwidth = UIScreen.main.bounds.width/2 - 60
        case (.pad, .portrait):
            cellwidth = (UIScreen.main.bounds.width - 45)/2
        case (.pad, .portraitUpsideDown):
            cellwidth = (UIScreen.main.bounds.width - 45)/2
        case (.pad, .landscapeLeft):
            cellwidth = (UIScreen.main.bounds.width - 60)/3
        case (.pad, .landscapeRight):
            cellwidth = (UIScreen.main.bounds.width - 60)/3
        default:
            cellwidth = 0
        }
        cellheight = cellwidth * 0.8
    }
}

