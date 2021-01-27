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
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    var type : ProgramTypes = .Original
    private var jsonData = JsonParsing()
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var mySegmentBar: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMainViewController()
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
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            type  = .Original
            reloadData()
        default:
            type  = .Live
            reloadData()
        }
    }
}

extension MainViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonData.getCnt(type: type)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.cellIdentifier, for: indexPath) as! ProgramCollectionViewCell
        cell.setSubViews(indexPath: indexPath, data: jsonData, dataTypeIndex: type)
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        var size: CGSize
        if(UIDevice.current.userInterfaceIdiom == .pad){
            width = (collectionView.frame.width * 0.9)/2.1
            height = collectionView.frame.height/3
            size = CGSize(width: width, height: height)
        }
        else{
            width = (screenWidth * 0.9)
            height = screenWidth * 0.5
            size = CGSize(width: width, height: height)
            
            print(width , height, size)
        }
        return size
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
