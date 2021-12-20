//
//  SignInResponse.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import Foundation

struct SignInResponse: Codable {
    var customerId: Int
    var userName: String
    var userId: Int
    var token: String
}
