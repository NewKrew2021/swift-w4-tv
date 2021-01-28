//
//  ViewController.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

enum ProgramTypes : String {
    case Original = "Original"
    case Live = "Live"
    
    static let programTypes = [Original, Live]
}

class MainViewController: UIViewController {
    private var type : ProgramTypes = .Original
    private var jsonData = JsonParsing()
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var mySegmentBar: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    private var cellwidth = CGFloat()
    private var cellheight = CGFloat()
    
    private var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMainViewController()
        setLongPressGestureRecognizer()
    }
    
    func initMainViewController(){
        initNavigationBar()
        initSearchBar()
        initSegmentControl()
        initCollectionView()
    }
    
    func initSegmentControl(){
        mySegmentBar.setTitle("Original", forSegmentAt: 0)
        mySegmentBar.setTitle("Live", forSegmentAt: 1)
        mySegmentBar.selectedSegmentIndex = 0
        mySegmentBar.addTarget(self, action: #selector(self.segmentBtnPressed(_:)), for: .valueChanged)
    }
    
    func initNavigationBar(){
        let rightButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(systemName: "heart.fill")
            button.style = .plain
            return button
        }()
        
        rightButton.target = self
        rightButton.action = #selector(buttonPressed)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "kakaoTV"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
    }
    
    func initSearchBar(){
        mySearchBar.placeholder = "Search"
    }
    
    func initCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        myCollectionView.collectionViewLayout = flowLayout
        myCollectionView.register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: ProgramCollectionViewCell.cellIdentifier)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    @objc func buttonPressed(){
        
    }
    
    func reloadData(){
        myCollectionView.reloadData()
    }
    
    @objc func segmentBtnPressed(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            type  = .Original
            reloadData()
        default:
            type  = .Live
            reloadData()
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        flag = !flag
        self.reloadData()
    }
}

extension MainViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonData.getCnt(type: type)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.cellIdentifier, for: indexPath) as! ProgramCollectionViewCell
        cell.setSubViews(indexPath: indexPath, data: jsonData, dataTypeIndex: type)
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
            cellwidth = (UIScreen.main.bounds.width - 50)/2
        case (.pad, .portraitUpsideDown):
            cellwidth = (UIScreen.main.bounds.width - 50)/2
        case (.pad, .landscapeLeft):
            cellwidth = (UIScreen.main.bounds.width - 90)/3
        case (.pad, .landscapeRight):
            cellwidth = (UIScreen.main.bounds.width - 90)/3
        default:
            cellwidth = 0
        }
        cellheight = cellwidth * 0.8
    }
}

extension MainViewController {
    func setLongPressGestureRecognizer(){
        let LongPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.LongPressView(_:)))
        LongPress.minimumPressDuration = 2
        self.view.addGestureRecognizer(LongPress)
    }
    
    @objc func LongPressView(_ sender: UILongPressGestureRecognizer){
        if let indexPath = self.myCollectionView?.indexPathForItem(at: sender.location(in: self.myCollectionView)) {
            let cell = self.myCollectionView?.cellForItem(at: indexPath)
            
            if  (sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled || sender.state == UIGestureRecognizer.State.failed
                || sender.state == UIGestureRecognizer.State.changed) { return }
            else{
                print("you can do something with the cell or index path here")
            }
        }
    }
}

extension UIViewController {
    var topbarHeight: CGFloat {
        var statusBarHeight: CGFloat
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
