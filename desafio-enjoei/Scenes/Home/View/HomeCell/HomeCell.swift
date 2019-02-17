//
//  HomeCell.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var photoDefaultImageView: DownloadImageView!
    @IBOutlet weak var userImageView: DownloadImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var discountView: CorneredView!
    @IBOutlet weak var discountLabel: UILabel!
    
    class var identifier:String {return String(describing: type(of: HomeCell.self))}
    
    var onLikeButtonPressed:((Bool) -> Void)?
    
    var isLiked: Bool = false
    
    var discount: Int = 0 {
        didSet {
            guard discount != 0 else {
                discountView.isHidden = true
                discountLabel.text = ""
                return
            }
            discountView.isHidden = false
            discountLabel.text = "-\(discount)%"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoDefaultImageView.image = nil
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        bottomView.layer.addBorder(edge: .top, color: .mainGray, thickness: 1)
        likeView.layer.addBorder(edge: .left, color: .mainGray, thickness: 1)
    }
    
    @IBAction func likeTappedButton(_ sender: Any) {
        isLiked = !isLiked
        onLikeButtonPressed?(isLiked)
    }
}

extension HomeCell: HomeCellPresenterView {
    func display(title: String) {
        titleLabel.text = title
    }
    
    func display(textColor: String, color: UIColor) {
        descriptionLabel.addColor(with: textColor, color: color)
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
    
    func display(url: String) {
        photoDefaultImageView.setUrl(url)
    }
    
    func display(userUrl: String) {
        userImageView.setUrl(userUrl, displayLoading: false)
    }
    
    func display(discount: Int) {
        self.discount = discount
    }
    
    func display(like: String) {
        likeButton.setTitle(like, for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_selected"), for: .normal)
        likeButton.setTitleColor(.mainRed, for: .normal)
    }
    
    func display(dislike: String) {
        likeButton.setTitle(dislike, for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        likeButton.setTitleColor(.mainGrayLike, for: .normal)
    }
    
    func display(likeCount: String) {
        likeButton.setTitle(likeCount, for: .normal)
    }
}
