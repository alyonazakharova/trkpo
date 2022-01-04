//
//  AllRoomsPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import Foundation

protocol AllRoomsPresenterProtocol: AnyObject {
    init(view: AllRoomsViewController)
    func loadRooms()
    func removeRoom()
}


class AllRoomsPresenter: AllRoomsPresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: AllRoomsViewController?
    
    required init(view: AllRoomsViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func loadRooms() {
        //todo
    }
    
    func removeRoom() {
        //todo
    }
}
