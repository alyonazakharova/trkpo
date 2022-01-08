//
//  ReservationPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import Foundation

protocol ReservationPresenterProtocol: AnyObject {
    func getReservations()
    init(view: ReservationViewController)
}

class ReservationPresenter: ReservationPresenterProtocol {
    
    var reservations: [ReservationModel]
    
    var view: ReservationViewController?
    
    required init(view: ReservationViewController) {
        self.view = view
        self.reservations = []
    }
    
    func getReservations() {
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
            self.reservations = receivedReservations
            DispatchQueue.main.async {
                print("Reservation loading finished")
//              self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
