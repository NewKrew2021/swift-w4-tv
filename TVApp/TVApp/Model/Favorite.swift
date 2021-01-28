//
//  Favorite.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/28.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation

protocol FavoriteProtocol {
    var id: Int { get }
    var title: String { get }
    var channel: String { get }
}

class Favorite: FavoriteProtocol {
    
    private(set) var id: Int
    private(set) var title: String
    private(set) var channel: String
    
    init(_ id: Int, _ title: String, _ channel: String) {
        self.id = id
        self.title = title
        self.channel = channel
    }
    
}
