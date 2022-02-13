//
//  AllRoomsPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import Foundation
import UIKit

protocol AllRoomsPresenterDelegate: AnyObject {
    func presentRooms(rooms: [RoomModel])
}

typealias PresenterDelegate = AllRoomsPresenterDelegate & UIViewController


class AllRoomsPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getRooms() {
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
    
    public func deleteRoom(roomId: String) {
        var request = URLRequest(url: URL(string: .deleteRoomUrl + roomId)!)
        
        request.httpMethod = "DELETE"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if (httpResponse.statusCode != 200) {
                    print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                    return
                }
            }
            self.getRooms()
        }
        task.resume()
    }
}
