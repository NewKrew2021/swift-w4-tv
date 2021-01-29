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
    private var cellcount = 0
    private var cellwidth = CGFloat()
    private var cellheight = CGFloat()
    private var flag = false
    private var workItem = DispatchWorkItem() {}

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var TVCollectionView: MyCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        overrideUserInterfaceStyle = .dark
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(likesButtonTouched)), animated: true)
        
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchedContentView = touches.first?.view else { return }
        guard let titleLabel = touchedContentView.subviews[2] as? UILabel else { return }
        guard let channelNameLabel = touchedContentView.subviews[3] as? UILabel else { return }
        guard let idLabel = touchedContentView.subviews[6] as? UILabel else { return }
        guard let heartImageView = touchedContentView.subviews[7] as? UIImageView else { return }
        let title = titleLabel.text ?? ""
        let channelName = channelNameLabel.text ?? ""
        guard let id = Int(idLabel.text!) else { return }
        let likeIsIn = Likes.isIn(key: id)

        
        let time = DispatchTime.now() + .seconds(2)
        workItem = DispatchWorkItem() {
            Likes.insertOrDelete(like: Like(title: title, channelName: channelName, id: id))
            heartImageView.alpha = likeIsIn ? 1 : 0
            heartImageView.isHidden = false
            let duration = TimeInterval(0.7)
            let animation = {
                heartImageView.alpha = likeIsIn ? 0 : 1
            }
            UIView.animate(withDuration: duration, animations: animation) {_ in
                heartImageView.isHidden = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: time, execute : workItem)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        workItem.cancel()
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
    
    @objc func likesButtonTouched() {
        let likesTableViewController = LikesTableViewController()
        present(likesTableViewController, animated: true, completion: nil)
    }
}
