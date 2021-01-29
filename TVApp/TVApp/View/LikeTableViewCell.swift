//
//  LikeTableViewCell.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import UIKit

class LikeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    
    func setData(title:String, channelName:String, id:Int) {
        self.titleLabel.text = title
        self.subInfoLabel.text = "\(channelName) (\(id))"
    }
}
