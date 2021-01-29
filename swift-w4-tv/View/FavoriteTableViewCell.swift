//
//  FavoriteTableViewCell.swift
//  swift-w4-tv
//
//  Created by 이준형 on 2021/01/28.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "favoriteCell"
    var favoriteList : [favoriteProgram] = UserDefault.getData()
    
    private var titleLabel : UILabel! = UILabel()
    private var channelNameLabel: UILabel! = UILabel()
    private var idLabel : UILabel! = UILabel()
    
    private let screenwidth = UIScreen.main.bounds.size.width
    private let screenheight = UIScreen.main.bounds.size.height
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func initUI() {
        contentView.addSubview(titleLabel)
        titleLabel?.font = UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .bold)
        titleLabel?.contentMode = .top
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        titleLabel?.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel?.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
        
        
        contentView.addSubview(channelNameLabel)
        channelNameLabel?.font = UIFont.systemFont(ofSize: UIFont.labelFontSize*0.7, weight: .light)
        channelNameLabel?.contentMode = .top
        channelNameLabel?.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel?.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 1).isActive = true
        channelNameLabel?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        channelNameLabel?.sizeToFit()
        
        contentView.addSubview(idLabel)
        idLabel?.font = UIFont.systemFont(ofSize: UIFont.labelFontSize*0.7, weight: .light)
        idLabel?.contentMode = .top
        idLabel?.translatesAutoresizingMaskIntoConstraints = false
        idLabel?.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 1).isActive = true
        idLabel?.leadingAnchor.constraint(equalTo: channelNameLabel!.trailingAnchor, constant: 3).isActive = true
        idLabel?.sizeToFit()
    }
    
    func setFavoritePrograms(indexPath: IndexPath){
        self.titleLabel?.text = favorite.favoriteList[indexPath.row].title
        self.channelNameLabel?.text = favorite.favoriteList[indexPath.row].channelName
        self.idLabel?.text = String(favorite.favoriteList[indexPath.row].id)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
