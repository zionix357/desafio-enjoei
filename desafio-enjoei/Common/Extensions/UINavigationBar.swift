//
//  UINavigationBar.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func hideHairline(barTint: UIColor = .white, isTransparent: Bool = false) {
        shadowImage = UIImage()
        barTintColor = barTint
        if isTransparent {setBackgroundImage(UIImage(), for: .default)}
    }
}
