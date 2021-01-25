//
//  ViewController.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initMainViewController()
    }

    func initMainViewController(){
        NavigationBar().initNavigationBar(view: self)
        OriginalProgramScrollView().initOriginalProgramScrollView(view: self)
    }
}

