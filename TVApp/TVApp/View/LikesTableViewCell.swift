//
//  LikesTableViewCell.swift
//  TVApp
//
//  Created by Hochang Lee on 2021/01/28.
//

import UIKit

class LikesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        placeSubViews()
    }
    
    func placeSubViews() {
        placeTitleLabel()
        placeChannelNameLabel()
        placeIdLabel()
    }
    
    func placeTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func placeChannelNameLabel() {
        channelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        channelNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        channelNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        channelNameLabel.sizeToFit()
        channelNameLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    func placeIdLabel() {
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: channelNameLabel.trailingAnchor, constant: 3).isActive = true
        idLabel.sizeToFit()
        idLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    func setSubViews(like : Like) {
        titleLabel.text = like.title
        channelNameLabel.text = like.channelName
        idLabel.text = "(\(like.id))"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
