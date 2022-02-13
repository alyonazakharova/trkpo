//
//  EquipmentPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import Foundation
import UIKit

protocol EquipmentPresenterDelegate: AnyObject {
    func presentRooms(rooms: [RoomModel])
}

typealias PresenterDelegateEquipment = EquipmentPresenterDelegate & UIViewController

class EquipmentPresenter {
    
    
    weak var delegate: PresenterDelegateEquipment?
    
    public func setViewDelegate(delegate: PresenterDelegateEquipment) {
        self.delegate = delegate
    }
    
    func getRooms() {
        var request = URLRequest(url: URL(string: .getAllRoomsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            
            let receivedRooms = try? JSONDecoder().decode([RoomModel].self, from: data)
            self?.delegate?.presentRooms(rooms: receivedRooms!)
        }
        task.resume()
    }
}
