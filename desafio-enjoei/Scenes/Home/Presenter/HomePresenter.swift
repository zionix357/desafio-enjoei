//
//  HomePresenter.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomePresenter: NetworkManager {
    private(set) weak var view: HomePresenterView?
    private(set) var router: HomePresenterRouter
    private var page: Int = 1
    private var totalPages: Int = 2
    var products: [Product] = []
    init(view: HomePresenterView, router: HomePresenterRouter) {
        self.view = view
        self.router = router
    }
    func present() {
        view?.configureToRefresh()
        view?.dismissMessageView()
        view?.startLoading(side: 50, text: "Fetching...", backgroundColor: .white)
        self.getProducts(urlString: "qdfq10ii") { [weak self] (response, error) in
            self?.view?.stopLoading()
            guard let products = response else {
                switch error {
                case .error(let message),
                     .notFound(let message),
                     .parseError(let message),
                     .badRequest(let message),
                     .noContent(let message),
                     .unauthorized(let message),
                     .noConnection(let message):
                    self?.view?.displayMessageView(
                        icon: .notFound,
                        text: message,
                        sizeIcon: 100,
                        backgroundColor: .white)
                default : break
                }
                return
            }
            guard products.count > 0 else {
                self?.view?.displayMessageView(
                    icon: .notFound,
                    text: "No data found.",
                    sizeIcon: 100,
                    backgroundColor: .white)
                return
            }
            self?.products = products
            self?.view?.reloadData()
        }
    }
    private func getProducts(urlString: String, completed: @escaping([Product]?, ServiceRequestError) -> Void) {
        request(
            endpoint: .products(urlString),
            method: .get,
            parameters: nil,
            compoundURL: false,
            success: { (response: ResponseProducts) in
            completed(response.products?.compactMap {
                $0
                }, .none("Success."))
        }, failure: { (error) in
            completed(nil, error)
        })
    }
    func pullRefresh() {
        page = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.getProducts(urlString: "vNWpzLB9") { response, error in
                self?.view?.stopLoading()
                guard let products = response else {
                    switch error {
                    case .error(let message),
                         .notFound(let message),
                         .parseError(let message),
                         .badRequest(let message),
                         .noContent(let message),
                         .unauthorized(let message),
                         .noConnection(let message):
                        self?.view?.display(error: message)
                    default : break
                    }
                    return
                }
                guard products.count > 0 else {
                    self?.view?.display(error: "No data found.")
                    return
                }
                self?.products = products
                self?.view?.reloadData()
            }
        }
    }
    func getMoreProducts(for row: Int) {
        if row == products.count - 1 {
            if page != totalPages {
                self.getProducts(urlString: "X2r3iTxJ") { [weak self] response, error in
                    self?.view?.stopLoading()
                    guard let products = response else {
                        switch error {
                        case .error(let message),
                             .notFound(let message),
                             .parseError(let message),
                             .badRequest(let message),
                             .noContent(let message),
                             .unauthorized(let message),
                             .noConnection(let message):
                            self?.view?.display(error: message)
                        default : break
                        }
                        return
                    }
                    guard products.count > 0 else {
                        self?.view?.display(error: "No data found.")
                        return
                    }
                    self?.products += products
                    if let indexPaths = self?.calculateIndexPathsToReload(from: products) {
                        self?.view?.reloadData(indexPaths: indexPaths)
                    } else {
                        self?.view?.reloadData()
                    }
                    self?.page += 1
                }
            }
        }
    }
    private func calculateIndexPathsToReload(from newProducts: [Product]) -> [IndexPath] {
        let startIndex = products.count - newProducts.count
        let endIndex = startIndex + newProducts.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    func onDidSelect(for row: Int) {
        router.onDetail(product: products[row])
    }
    func configure(for row: Int, _ cell: HomeCell) {
        var product = products[row]
        cell.accessibilityIdentifier = "test-\(row)"
        cell.display(url: product.defaultPhoto?.urlImage(size: cell.bounds.idealSize) ?? "")
        cell.display(userUrl: product.user?.avatar?.urlImage ?? "")
        cell.display(title: product.title ?? "")
        cell.display(discount: product.discountPercentage ?? 0)
        cell.display(likeCount: String(product.likesCount ?? 0))
        cell.onLikeButtonPressed = { (isLiked) in
            guard let count = product.likesCount else { return }
            if isLiked {
                product.likesCount = count + 1
                cell.display(like: "\(count + 1)")
            } else {
                product.likesCount = count - 1
                cell.display(dislike: "\(count - 1)")
            }
        }
        guard let size = product.size else {
            cell.display(description: product.priceFormatted)
            cell.display(textColor: product.priceFormatted, color: .mainRed)
            return
        }
        cell.display(description: "\(product.priceFormatted) - tam \(size)")
        cell.display(textColor: product.priceFormatted, color: .mainRed)
    }
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
