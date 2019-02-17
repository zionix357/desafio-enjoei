//
//  HomePresenterView.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol HomePresenterView: AnyObject {
    func startLoading(side: CGFloat, text: String, backgroundColor: UIColor)
    func stopLoading()
    func reloadData()
    func reloadData(indexPaths: [IndexPath])
    func display(error: String)
    func configureToRefresh()
    func displayMessageView(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor)
    func dismissMessageView()
}
