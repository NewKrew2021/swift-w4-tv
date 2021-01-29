//
//  FavoriteTableViewController.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/28.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UIViewController {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    var favoriteList : [favoriteProgram] = favorite.favoriteList
    var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight))
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.cellIdentifier)
        self.view.addSubview(self.myTableView)
    }
}

extension FavoriteTableViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite.favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: FavoriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.cellIdentifier, for: indexPath) as? FavoriteTableViewCell {
            cell.setFavoritePrograms(indexPath: indexPath)
            print(indexPath)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
