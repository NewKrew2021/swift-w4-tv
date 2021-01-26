//
//  DurationUILabel.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/26.
//

import UIKit

class DurationUILabel: UILabel {

    @IBInspectable var topInset: CGFloat = 3
    @IBInspectable var bottomInset: CGFloat = 3
    @IBInspectable var leftInset: CGFloat = 3
    @IBInspectable var rightInset: CGFloat = 3
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    func setText(text: String) {
        self.text = text
        adjustsFontSizeToFitWidth = true
        sizeToFit()
    }
}
