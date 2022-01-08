//
//  Customer.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation

struct Customer: Codable {
    let id: Int
    var name: String
    var phone: String
    var user: UserModel
}
