//
//  DetailController.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    struct Constants { // swiftlint:disable nesting
        struct Nib {
            static let PhotoPageCell = "PhotoPageCell"
        }
    }
    lazy var presenter: DetailPresenter = {
        let presenter = DetailPresenter(
            view: self,
            router: DetailPresenterRouter(viewController: self)
        )
        return presenter
    }()
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(
                UINib(nibName: Constants.Nib.PhotoPageCell,
                      bundle: .main),
                forCellWithReuseIdentifier: PhotoPageCell.identifier)
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        automaticallyAdjustsScrollViewInsets = false
        presenter.present()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension DetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.product?.photos?.count ?? 0
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoPageCell.identifier,
            for: indexPath) as! PhotoPageCell
        presenter.configure(cell, for: indexPath.row)
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(
            x: scrollView.contentOffset.x + (scrollView.frame.width / 2),
            y: (scrollView.frame.height / 2))
        if let newPage = collectionView.indexPathForItem(at: center) {
            pageControl.currentPage = newPage.row
        }
    }
}

extension DetailController: DetailPresenterView {
    func display(discount: String) {
        discountPercentageLabel.text = discount
    }
    func display(price: String) {
        priceLabel.text = price
    }
    func display(
        strike: String,
        boldOne: String,
        boldTwo: String,
        color: UIColor) {
        priceLabel.addStrikethrough(
            stringStrike: strike,
            stringBoldOne: boldOne,
            stringBoldTwo: boldTwo,
            colorStrike: color)
    }
    func display(bold: String) {
        priceLabel.addBold(bold: bold)
    }
    func reloadData() {
        collectionView.reloadData()
    }
    func display(numberPages: Int) {
        pageControl.numberOfPages = numberPages
    }
}
