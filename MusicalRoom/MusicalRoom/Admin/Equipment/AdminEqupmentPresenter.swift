//
//  AdminEqupmentPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 07.01.2022.
//

import Foundation

protocol AdminEquipmentPresenterProtocol: AnyObject {
    init(view: AdminEquipmentViewController)
    func loadRooms() -> [Room]
    func loadInstruments()
    func addEquipment()
}


class AdminEquipmentPresenter: AdminEquipmentPresenterProtocol {
    var rooms = [Room]()
    var roomsNames = [String]()

    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: AdminEquipmentViewController?
    
    required init(view: AdminEquipmentViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func loadRooms() -> [Room] {
        return []
    }
    
    func loadInstruments() {
        
    }
    
    func addEquipment() {
        
    }
}
