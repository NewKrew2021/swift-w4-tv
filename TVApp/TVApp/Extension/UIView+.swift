//
//  UIView+.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/29.
//

import UIKit

extension UIView {
    func findCollectionViewCell() -> CollectionViewCell? {
        if let nextResponder = self.next as? CollectionViewCell {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findCollectionViewCell()
        } else {
            return nil
        }
    }
}
