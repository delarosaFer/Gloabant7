//
//  UIView+Circle.swift
//  CV App
//
//  Created by David Castro Cisneros on 7/9/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import UIKit

extension UIView {
    func circled() {
        self.clipsToBounds =  true
        layer.cornerRadius = max(bounds.height, bounds.width) / CGFloat(NumberF.half.rawValue)
    }
}

