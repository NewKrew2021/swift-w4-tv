//
//  LikeTableViewController.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import UIKit

class LikeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "likeTableViewCell", for: indexPath) as! LikeTableViewCell
        let likeId : Int = Array(Likes.getKeys())[indexPath.row]
        let like : Like = Likes.getItem(key: likeId) ?? Like(title: "", channelName: "")
        
        cell.setData(title: like.title, channelName: like.channelName, id: likeId)
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Likes.count
    }
}
