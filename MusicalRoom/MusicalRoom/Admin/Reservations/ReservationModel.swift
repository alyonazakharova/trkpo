//
//  Reservations.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation

struct ReservationModel: Codable {
    var id: Int
    var date: String
    var room: Room
    var confirmed: Bool
}
