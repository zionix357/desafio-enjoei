//
//  Promotion.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Promotion: Codable {
    let promotionSlug: String?
    let startsAt, expiresAt: String?
    let price: String?
    let active: Bool?
    let promotionId: Int?
    let productPrice: String?
    let discountPercentage: Int?
}
