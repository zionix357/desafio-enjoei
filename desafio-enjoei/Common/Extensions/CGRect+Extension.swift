//
//  CGRect+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension CGRect {
    var idealSize: String {
        if width <= 180{
            return "180x180/"
        } else if width <= 460 {
            return "460x460/"
        } else if width <= 800 {
            return "800x800/"
        } else {
            return "1100xN/"
        }
    }
}


