//
//  StringUtils.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/1/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class StringUtils {
    class func replace(_ path: String, string: String, withString: String) -> String {
        return path.replacingOccurrences(
            of: string,
            with: withString,
            options: NSString.CompareOptions.literal,
            range: nil)
    }
}
