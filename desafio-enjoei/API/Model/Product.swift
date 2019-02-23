//
//  Product.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct ResponseProducts: Codable {
    let products: [Product]?
    let pagination: Pagination?
    let includeMySize: Bool?
}

struct Product: Codable {
    let freeShipping: Bool?
    let discountPercentage: Int?
    let used: Bool?
    let promoted: Bool?
    let photos: [Photo]?
    let firstPublishedAtRoundedByWeek: String?
    let availableUnits: Bool?
    let canBeDisabledByAdmin: Bool?
    let id: Int?
    let state: String?
    let publishedAt: String?
    let soldUnits: Bool?
    let brand, slug: String?
    let weight: Double?
    let originalPriceUnformatted: String?
    let publishedCommentsCount: Int?
    let maxInstallmentPrice: Double?
    let size: String?
    let userId: Int?
    let originalPriceInteger: Int?
    let createdAt: String?
    let softShipping: Bool?
    let title: String?
    let priceFloat: Int?
    let content: String?
    let maximumInstallment: Int?
    let canBeEnabledByAdmin: Bool?
    let categoryId: Int?
    let likeUserIds: [Int]?
    let categories: Categories?
    let normalizedBrand: String?
    let mostCheapShippingCitiesAndStates: [String]?
    let quantity: Int?
    let departmentId: Int?
    let initialQuantity: Int?
    let averagePrice: Double?
    let seoTitle: String?
    var likesCount: Int?
    let location: Location?
    let firstPublishedAt: String?
    let priceUnformatted: String?
    let minimumPriceInteger, promotedStep: Int?
    let defaultPhoto: Photo?
    let user: User?
    let proSeller: Bool?
    let categorySlug, href: String?
    let price: Int?
    let promotedView: Bool?
    let categoryTags: [CategoryTag]?
    let promotions: [Promotion]?
    let awesomeness: Int?
    var priceFormatted: String {
        return "R$ \(price ?? 0)"
    }
    var originalPriceFormatted: String {
        return "R$ \(originalPriceInteger ?? 0)"
    }
}
