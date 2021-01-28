//
//  LikesTableViewController.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/28.
//

import UIKit

class LikesTableViewController: UITableViewController {

    private let LikesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LikesTableViewCell", bundle: nil), forCellReuseIdentifier: "LikesTableViewCell")
    }

    // MARK: - Table view data source    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Likes.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableViewCell") as! LikesTableViewCell
        var row = indexPath.row
        var targetKey = Dictionary<Int, Like>.Key()
        let keys = Likes.getKeys()
        for key in keys {
            if row == 0 {
                targetKey = key
                break
            }
            row -= 1
        }
        cell.setSubViews(like: Likes.getLkieItem(key: targetKey))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
