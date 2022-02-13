//
//  UserModel.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    var userName: String
    var password: String
    var role: String
}
