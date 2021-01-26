//
//  SearchBarView.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/26.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit

class SearchBar {
    private var searchBar = UISearchBar()
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    
    func initSearchBar(view : UIViewController){
        searchBar.frame = CGRect(x: 0, y: view.topbarHeight, width: screenWidth, height: screenHeight / 20 )
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .white
        view.view.addSubview(searchBar)
    }
}
