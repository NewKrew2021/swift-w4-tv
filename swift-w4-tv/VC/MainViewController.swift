//
//  ViewController.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    private var jsonData = JsonParsing()
    private var programType : String = "Original"
    
    private let myNaviBar = UINavigationBar()
    private let mySearchBar = UISearchBar()
    private let mySegmentBar = UISegmentedControl(items: ["Original", "Live"])
    
    private let myCollectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        overrideUserInterfaceStyle = .dark
        
        initMainViewController()
    }
    func initSegmentControl(){
        mySegmentBar.frame = CGRect(x: screenWidth * 0.1, y: self.topbarHeight + screenHeight / 20 , width: screenWidth * 0.8, height: screenHeight / 30 )
        mySegmentBar.selectedSegmentIndex = 0
        mySegmentBar.addTarget(self, action: #selector(self.segmentBtnPressed(_:)), for: .valueChanged)
        self.view.addSubview(mySegmentBar)
    }
    
    func initMainViewController(){
        initNavigationBar()
        initSearchBar()
        initSegmentControl()
        initCollectionView()
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
        mySearchBar.backgroundColor = .white
        mySearchBar.translatesAutoresizingMaskIntoConstraints = false
        mySearchBar.frame = CGRect(x: 0, y: self.topbarHeight, width: screenWidth, height: screenHeight / 20 )
        self.view.addSubview(mySearchBar)
    }
    
    func initCollectionView(){
        myCollectionView.myView.delegate = self
        myCollectionView.myView.dataSource = self
        self.view.addSubview(myCollectionView.myView)
    }
    
    @objc func buttonPressed(){
        
    }
    
    @objc func segmentBtnPressed(_ sender: UISegmentedControl){
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            programType  = "Original"
            myCollectionView.reloadData()
        default:
            programType  = "Live"
            myCollectionView.reloadData()
        }
    }
}

extension MainViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if programType == "Original" {
            return jsonData.getOrgCnt
        }
        else {
            return jsonData.getliveCnt
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if programType == "Original" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OriginalCollectionViewCell.cellIdentifier, for: indexPath) as! OriginalCollectionViewCell
            cell.setSubViews(indexPath: indexPath, data: jsonData)
            cell.layer.borderWidth = 1
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.cellIdentifier, for: indexPath) as! LiveCollectionViewCell
            cell.setSubViews(indexPath: indexPath, data: jsonData)
            cell.layer.borderWidth = 1
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width * 0.9, height: height / 2)
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
