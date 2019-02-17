//
//  User.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct User: Codable {
    let sellerPaidSellsCount: Int?
    let gender: String?
    let city, nickname, name: String?
    let description: String?
    let id: Int?
    let avatar: Avatar?
    let state: String?
    let title: String?
    let email: String?
    let href: String?
}
