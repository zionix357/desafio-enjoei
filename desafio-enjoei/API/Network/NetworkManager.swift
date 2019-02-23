//
//  NetworkManager.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum Endpoint: APIRouter {
    case products(String)
    var route: String {
        switch self {
        case .products(let productsByEndpoint): return "\(productsByEndpoint)"
        }
    }
}

protocol NetworkManager {
    var baseURL: String { get }
    func request<R: Decodable>(
        endpoint: Endpoint,
        method: HTTPMethod,
        parameters: [String: Any]?,
        compoundURL: Bool,
        success: @escaping (_ response: R) -> Void,
        failure: @escaping (_ error: ServiceRequestError) -> Void)
}

protocol APIRouter {
    var route: String { get }
}

extension NetworkManager {
    var baseURL: String {
        return "https://pastebin.com/raw/"
    }
    func request<R: Decodable>(
        endpoint: Endpoint,
        method: HTTPMethod,
        parameters: [String: Any]?,
        compoundURL: Bool,
        success: @escaping (_ response: R) -> Void,
        failure: @escaping (_ error: ServiceRequestError) -> Void) {
        var url = baseURL + endpoint.route
        let session = URLSession.shared
        let request = NSMutableURLRequest()
        request.httpMethod = method.rawValue
        if let parameters = parameters {
            if compoundURL {
                url += parameters.buildQueryString()
            } else {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        request.url = URL(string: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            DispatchQueue.main.async {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                guard error == nil else {
                    failure(.noConnection("No internet connection."))
                    return
                }
                guard let data = data, !data.isEmpty else {
                    failure(.noContent("No data in service."))
                    return
                }
                switch statusCode {
                case 200, 201:
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(R.self, from: data)
                        success(response)
                    } catch {
                        failure(.parseError("Error mapping Data."))
                    }
                case 400:
                    failure(.badRequest("The server will not be able to process the request."))
                case 401:
                    failure(.unauthorized("Not authorized."))
                case 404:
                    failure(.notFound("Server not found."))
                default:
                    failure(.error("Unidentified error, please try again later."))
                }
            }
        })
        task.resume()
    }
}
