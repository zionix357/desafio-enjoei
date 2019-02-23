//
//  HomeController.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import GIFRefreshControl

class HomeController: UIViewController {
    struct Constants { // swiftlint:disable nesting
        struct Nib {
            static let HomeCell = "HomeCell"
            static let HomeHeaderView = "HomeHeaderView"
            static let PullToRequestView = "PullToRequestView"
        }
    }
    lazy var presenter: HomePresenter = {
        let presenter = HomePresenter(
            view: self,
            router: HomePresenterRouter(viewController: self)
        )
        return presenter
    }()
    let refreshControl = GIFRefreshControl()
    @IBOutlet weak var customNavigationView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(
                UINib(nibName: Constants.Nib.HomeCell,
                      bundle: .main),
                forCellWithReuseIdentifier: HomeCell.identifier)
            collectionView.register(
                UINib(nibName: Constants.Nib.HomeHeaderView,
                      bundle: .main),
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HomeHeaderView.identifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackArrowButton()
        navigationController?.navigationBar.hideHairline(barTint: .clear, isTransparent: true)
        customNavigationView.layoutIfNeeded()
        customNavigationView.layer.addBorder(edge: .bottom, color: .mainGray, thickness: 1)
        presenter.present()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    @objc func refresh() {
        presenter.pullRefresh()
    }
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return presenter.products.count
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCell.identifier,
            for: indexPath) as! HomeCell
        presenter.configure(for: indexPath.row, cell)
        return cell
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        presenter.onDidSelect(for: indexPath.row)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HomeHeaderView.identifier,
            for: indexPath) as! HomeHeaderView
        return headerView
    }
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        presenter.getMoreProducts(for: indexPath.row)
    }
}

extension HomeController: HomePresenterView {
    func startLoading(side: CGFloat, text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(side: side, text: text, backgroundColor: backgroundColor)
    }
    func stopLoading() {
        view.dismissLoadingIndicator()
        refreshControl.endRefreshing()
    }
    func reloadData() {
        collectionView.reloadData()
    }
    func reloadData(indexPaths: [IndexPath]) {
        collectionView.insertItems(at: indexPaths)
    }
    func display(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .default))
        present(alert, animated: true, completion: nil)
    }
    func configureToRefresh() {
        guard
            let gitURL = Bundle.main.url(forResource: "pizza-loop", withExtension: "gif"),
            let data = try? Data(contentsOf: gitURL) else { return }
        refreshControl.animatedImage = GIFAnimatedImage(
            data: data)
        refreshControl.contentMode = .scaleAspectFill
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    func displayMessageView(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor) {
        view.displayMessageView(
        icon: .notFound,
        text: text,
        sizeIcon: sizeIcon,
        backgroundColor: backgroundColor,
        isButton: true,
        titleButton: "RELOAD") { [weak self] in
            self?.presenter.present()
        }
    }
    func dismissMessageView() {
        view.dismissMessageView()
    }
}
