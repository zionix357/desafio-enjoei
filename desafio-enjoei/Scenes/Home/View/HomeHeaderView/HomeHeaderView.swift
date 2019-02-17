//
//  HomeHeaderView.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomeHeaderView: UICollectionReusableView {
    @IBOutlet weak var timeLabel: UILabel!
    
    class var identifier:String {
        return String(describing: type(of: HomeHeaderView.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
