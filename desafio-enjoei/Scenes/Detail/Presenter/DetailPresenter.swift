//
//  DetailPresenter.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

class DetailPresenter {
    
    private(set) weak var view:DetailPresenterView?
    private(set) var router:DetailPresenterRouter
    
    var product : Product?
    
    init(view: DetailPresenterView, router: DetailPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present(){
        view?.display(numberPages: product?.photos?.count ?? 0)
        
        guard let discount = product?.discountPercentage, discount != 0 else {
            view?.display(price: product?._price ?? "")
            view?.display(bold: "\(product?.price ?? 0)")
            view?.display(discount: "")
            return
        }
        
        view?.display(price: "\(product?._originalPrice ?? "") \(product?._price ?? "")")
        view?.display(strike: product?._originalPrice ?? "", boldOne: "\(product?.originalPriceInteger ?? 0)", boldTwo: "\(product?.price ?? 0)", color: .mainRed)
        view?.display(discount: "\(discount)% OFF")
    }
    
    func configure(_ cell: PhotoPageCell, for row:Int) {
        cell.display(url: product?.photos?[row].urlImage(size: cell.bounds.idealSize) ?? "")
    }
}
