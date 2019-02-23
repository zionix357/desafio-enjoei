//
//  PhotoPageCell.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class PhotoPageCell: UICollectionViewCell {
    class var identifier: String { return String(describing: type(of: PhotoPageCell.self)) }
    @IBOutlet weak var photoImageView: DownloadImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PhotoPageCell: PhotoPageCellPresenterView {
    func display(url: String) {
        photoImageView.setUrl(url)
    }
}
