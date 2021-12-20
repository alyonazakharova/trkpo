//
//  ReservePresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import Foundation

protocol ReservePresenterProtocol: AnyObject {
    func reserveButtonTapped(roomId: Int, date: String)
    init(view: ReserveViewController)
}

class ReservePresenter: ReservePresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: ReserveViewController?
    
    required init(view: ReserveViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func reserveButtonTapped(roomId: Int, date: String) {
        print("DATE: \(date)")
        print("ROOM ID: \(roomId)")
        
        var request = URLRequest(url: URL(string: "http://localhost:8080/reservations/add")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "date": date,
            "roomId": roomId,
            "customerId": UserData.customerId
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
        group.enter()
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if (httpResponse.statusCode != 200) {
                    self.errorOccured = true
                    print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                }
            }
            self.group.leave()

        }
        task.resume()
        
        group.notify(queue: .main) { [weak self] in
            if (self?.errorOccured != nil && self?.errorOccured == true) {
                self?.view?.showAlert(title: "Oops. Seems like this room is already reserved for this day")
                return
            }
            self?.view?.showSuccessAlert()
        }
    }
}
