//
//  Extensions.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import UIKit

extension UIColor {
    static let textFieldBgColor = UIColor(named: "text-field-bg")
    static let infoLabelTextColor = UIColor(named: "info-text")
}

extension String {
    static let homeInfo = "Our company has been operating since 1994. Such stars as Alla Pugacheva, Philip Kirkorov and many others worked with us. Order your music room as soon as possible!"
    
    // * * * URLS * * *
    
    //POST request to add new user
    static let registrationUrl = "http://localhost:8080/auth/register"
    
    //POST request to sign in. If OK returns userId, customerId, userName and token
    static let signInUrl = "http://localhost:8080/auth/signin"
    
    //GET request to get all rooms
    static let getAllRoomsUrl = "http://localhost:8080/rooms/all"
    
    //POST request to add new room
    static let addRoomUrl = "http://localhost:8080/data/room"
    
    //POST request to add new instrument
    static let addInstrumentUrl = "http://localhost:8080/data/instrument"
}
