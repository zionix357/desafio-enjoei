//
//  Dictionary+Extension.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 09/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

extension Dictionary {
    func buildQueryString() -> String {
        
        var urlVars: [String] = []
        
        for (key, value) in self {
            if let value = value as? [Any] {
                for v in value {
                    if let encodedValue = "\(v)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed), let key = key as? String {
                        urlVars.append(key + "[]=" + encodedValue)
                    }
                }
            } else {
                if let valueString = value as? String, let encodedValue = valueString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed), let key = key as? String {
                    urlVars.append(key + "=" + encodedValue)
                }
            }
        }
        
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
    
    var jsonString: String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            return String(data: data, encoding: .ascii)
        } catch {
            return nil
        }
    }
}
