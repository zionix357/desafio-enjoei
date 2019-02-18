//
//  UIColor+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let alpha: Float = 1.0
        let scanner = Scanner(string:hexString)
        var color:UInt32 = 0;
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
        
        return
    }
    
    static let mainGray = UIColor(hexString: "D8D8D8")!
    static let mainRed = UIColor(hexString: "F77274")!
    static let mainGrayLike = UIColor(hexString: "7D7A77")!
}
