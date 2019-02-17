//
//  UIViewController+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackArrowButton(){
        let backBtn = #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = backBtn
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtn
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
