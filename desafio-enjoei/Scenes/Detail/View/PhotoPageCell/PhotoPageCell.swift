//
//  PhotoPageCell.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class PhotoPageCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: DownloadImageView!
    
    class var identifier:String {
        return String(describing: type(of: PhotoPageCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PhotoPageCell: PhotoPageCellPresenterView {
    func display(url: String) {
        photoImageView.setUrl(url)
    }
}
