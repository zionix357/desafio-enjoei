//
//  UIView+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 10/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UIView {
    func addContainerView(
        _ containerView: UIView,
        onTop: Bool = false) {
        addSubview(containerView)
        if onTop {
            bringSubviewToFront(containerView)
        }
        tightConstrain(containerView)
    }
    func tightConstrain(_ containerView: UIView) {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
