//
//  HomePresenterRouter.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomePresenterRouter {
    struct Constants {
        struct Segue {
            static let ShowDetail = "detailSegue"
        }
    }
    
    private weak var viewController: HomeController?
    
    init(viewController: HomeController) {
        self.viewController = viewController
    }
    
    func onDetail(product: Any){
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowDetail, sender: product)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.ShowDetail, let destination = segue.destination as? DetailController, let product = sender as? Product {
            destination.presenter.product = product
        }
    }
}
