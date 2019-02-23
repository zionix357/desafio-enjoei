//
//  DetailPresenterRouter.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class DetailPresenterRouter {
    private weak var viewController: DetailController?
    init(viewController: DetailController) { self.viewController = viewController }
    func onPopViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
