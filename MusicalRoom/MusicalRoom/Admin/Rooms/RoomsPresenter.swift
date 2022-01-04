//
//  RoomsPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import Foundation

protocol RoomsPresenterProtocol: AnyObject {
    init(view: RoomsViewController)
    func addNewRoom(name: String, description: String, price: Int)
}


class RoomsPresenter: RoomsPresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: RoomsViewController?
    
    required init(view: RoomsViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func addNewRoom(name: String, description: String, price: Int) {
        var request = URLRequest(url: URL(string: .addRoomUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "name": name,
            "description": description,
            "price": price
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
                self?.view?.showAlert(title: "Ooops. Something went wrong")
                return
            }
            self?.view?.showAlert(title: "New room was added successfully")
        }
    }
}
