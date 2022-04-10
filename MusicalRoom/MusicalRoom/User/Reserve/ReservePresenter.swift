//
//  ReservePresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import Foundation
import UIKit

protocol ReservePresenterDelegate: AnyObject {
    func presentRooms(rooms: [RoomModel])
    func showAlert(title: String)
}

typealias PresenterDelegateReserve = ReservePresenterDelegate & UIViewController

class ReservePresenter {
    
    weak var delegate: PresenterDelegateReserve?
    
    public func setViewDelegate(delegate: PresenterDelegateReserve) {
        self.delegate = delegate
    }
    
    func createReservation(roomId: Int, date: String) {
        var request = URLRequest(url: URL(string: .addReservation)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "date": date,
            "roomId": roomId,
            "customerId": UserData.customerId
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode != 200) {
                    print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                    DispatchQueue.main.async {
                        self.delegate?.showAlert(title: "It seems like you've entered incorrect date")
                    }
                    return
                }
            }
            DispatchQueue.main.async {
                self.delegate?.showAlert(title: "Woohoo. You successfully reserved a room")
            }
        }
        task.resume()
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
