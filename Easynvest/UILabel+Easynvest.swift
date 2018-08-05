//
//  UILabel.swift
//  Easynvest
//
//  Created by Developer on 05/08/18.
//

import UIKit

extension UILabel {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont.preferredFont(forTextStyle: .subheadline)
        self.adjustsFontForContentSizeCategory = true
    }
}
