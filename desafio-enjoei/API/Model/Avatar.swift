//
//  Avatar.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Avatar: Codable {
    let imagePublicId: String?
    var urlImage: String {
        guard let url = imagePublicId else {
            return ""
        }
        return "https://photos.enjoei.com.br/public/460x460/\(url).jpg"
    }
}
