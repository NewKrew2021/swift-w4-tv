//
//  FavoritViewController.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/28.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import UIKit

class FavoritViewController: UITableViewController {
    
    @IBOutlet var favoriteTableView: UITableView!
    var db = SQLite()
    var favorites = [Favorite]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initDB()
        initView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        db.closeDB()
    }
    
    func initDB() {
        db.openDB()
        favorites = db.getAllFavorites()
        favoriteTableView.reloadData()
    }
    
    func initView() {
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : UITableViewCell = favoriteTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row].title
        cell.detailTextLabel?.text = "\(favorites[indexPath.row].channel) (\(favorites[indexPath.row].id))"

        return cell

    }

}
