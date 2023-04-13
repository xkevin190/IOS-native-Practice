//
//  ApiResponseModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 6/4/23.
//

import Foundation

// Berisikan variable Response
struct HTTPResponse<T: Codable>: Codable {
    var status: Int
    var data: T?
    var error: String?
}
