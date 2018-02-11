//
//  UIColor+random.swift
//  RotateUpdateSample
//
//  Created by Tomosuke Okada on 2018/02/11.
//  Copyright © 2018年 TomosukeOkada. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let r: CGFloat = CGFloat(arc4random_uniform(255)+1) / 255.0
        let g: CGFloat = CGFloat(arc4random_uniform(255)+1) / 255.0
        let b: CGFloat = CGFloat(arc4random_uniform(255)+1) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
