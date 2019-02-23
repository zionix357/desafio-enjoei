//
//  HomeCellPresenterView.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol HomeCellPresenterView: AnyObject {
    func display(title: String)
    func display(textColor: String, color: UIColor)
    func display(description: String)
    func display(url: String)
    func display(userUrl: String)
    func display(discount: Int)
    func display(likeCount: String)
    func display(like: String)
    func display(dislike: String)
    var onLikeButtonPressed: ((Bool) -> Void)? { get set }
}
