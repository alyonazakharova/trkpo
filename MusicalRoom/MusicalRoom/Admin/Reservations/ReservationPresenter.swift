//
//  ReservationPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation
import UIKit

protocol ReservationPresenterDelegate: AnyObject {
    func presentReservations(reservations: [ReservationModel])
}

typealias PresenterDelegateReservation = ReservationPresenterDelegate & UIViewController

class ReservationPresenter {
    
    weak var delegate: PresenterDelegateReservation?
    
    public func setViewDelegate(delegate: PresenterDelegateReservation) {
        self.delegate = delegate
    }
    
    public func getReservations() {
        var request = URLRequest(url: URL(string: .getAllReservationsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            guard let receivedReservations = try? JSONDecoder().decode([ReservationModel].self, from: data) else {
              print("Error: Couldn't decode data")
              return
            }
            self.delegate?.presentReservations(reservations: receivedReservations)
        }
        task.resume()
    }
    
    public func confirmReservation(reservationId: String) {
        var request = URLRequest(url: URL(string: .updateConfirmationUrl + reservationId)!)
        
        request.httpMethod = "PUT"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
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
            self.getReservations()
        }
        task.resume()
    }
}
