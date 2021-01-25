//
//  navigationBar.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/25.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class naviBar {
    
    private var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "heart.fill")
        button.style = .plain
        return button
    }()
    
    func initNavigationBar(view : UIViewController){
        view.navigationController?.navigationBar.isHidden = false
        view.navigationController?.navigationBar.backgroundColor = .white
        rightButton.target = self
        rightButton.action = #selector(buttonPressed)
        view.navigationController?.navigationBar.topItem?.title = "kakaoTV"
        view.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
    }
    
    @objc func buttonPressed(){
        print("like!")
    }

}
