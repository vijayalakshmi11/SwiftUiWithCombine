//
//  PlaceholderResponseModel.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import Foundation

struct PlaceholderResponseModelElement: Codable, Identifiable {
    let userId, id: Int
    let title, body: String
}

typealias PlaceholderResponseModel = [PlaceholderResponseModelElement]
