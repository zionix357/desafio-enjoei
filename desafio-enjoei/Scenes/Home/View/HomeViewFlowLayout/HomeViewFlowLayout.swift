//
//  HomeViewFlowLayout.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomeViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 10
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return (collectionView.bounds.width / CGFloat(numberOfColumns)) - cellPadding * 1.5
    }
    
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = 1
        minimumLineSpacing = 10
        sectionInset = UIEdgeInsets(top: 0, left: cellPadding, bottom: cellPadding * 2, right: cellPadding)
        scrollDirection = .vertical
        headerReferenceSize = CGSize(width: screenWidth, height: 65)
    }
    
    override var itemSize: CGSize {
        set{}
        get{
            return CGSize(width: Int(contentWidth), height: Int(contentWidth * 1.83))
        }
    }
}
