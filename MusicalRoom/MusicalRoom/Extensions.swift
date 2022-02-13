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
    
    //GET request to get all reservations
    static let getAllReservationsUrl = "http://localhost:8080/reservations/all"
    
    //POST request to get add new reservation
    static let addReservation = "http://localhost:8080/reservations/add"
    
    //GET request to get all instruments
    static let getAllInstrumentsUrl = "http://localhost:8080/data/all"
    
    //POST request to add instrument to the room
    static let addInstrumentToRoomUrl = "http://localhost:8080/data/room_instrument"
    
    //GET request to get customer's reservations
    static let getUserReservationsUrl = "http://localhost:8080/reservations/customer" // {id}
    
    //DELETE user's reservation by id
    static let deleteReservationUrl = "http://localhost:8080/reservations/customer/" // + reservation id
    
    //DELETE room by id
    static let deleteRoomUrl = "http://localhost:8080/data/room/" // + room id
    
    //DELETE instrument by id
    static let deleteInstrumentUrl = "http://localhost:8080/data/instrument/" // + instrument id
    
    //PUT request to change confirmation status
    static let updateConfirmationUrl = "http://localhost:8080/reservations/" // + reservation id
    
    
}
