//
//  ServiceRequestError.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

enum ServiceRequestError {
    case none(String)
    case parseError(String)
    case unauthorized(String)
    case notFound(String)
    case noConnection(String)
    case error(String)
    case badRequest(String)
    case noContent(String)
}
