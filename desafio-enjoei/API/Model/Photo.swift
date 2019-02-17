//
//  Photo.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: Int?
    let imagePublicId: String?
    
//    var urlImage : String {
//        get{
//            guard let url = imagePublicId else {
//                return ""
//            }
//            return "https://photos.enjoei.com.br/public/460x460/\(url).jpg"
//        }
//    }
    
    func urlImage(size: String) -> String{
        guard let url = imagePublicId else {
            return ""
        }
        return "https://photos.enjoei.com.br/public/" + size + url + ".jpg"
    }
}
