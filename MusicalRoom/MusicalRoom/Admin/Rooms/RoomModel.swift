//
//  RoomModel.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation

struct RoomModel: Codable {
    let id: Int
    var name: String
    var description: String
    var price: Int
}
