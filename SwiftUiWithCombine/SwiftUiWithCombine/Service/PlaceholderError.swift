//
//  PlaceholderError.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import Foundation

enum PlaceholderError: Error {
    case networkError(description: String)
    case parsingError(description: String)

}
