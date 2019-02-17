//
//  Pagination.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 14/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let totalEntries, pageSize, currentPage, nextPage: Int
}
