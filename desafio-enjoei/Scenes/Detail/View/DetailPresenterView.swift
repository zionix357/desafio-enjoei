//
//  DetailPresenterView.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol DetailPresenterView : AnyObject {
    func reloadData()
    func display(numberPages: Int)
    func display(price: String)
    func display(strike: String, boldOne: String, boldTwo: String, color: UIColor)
    func display(bold: String)
    func display(discount: String)
}
