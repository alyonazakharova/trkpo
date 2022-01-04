//
//  ProfilePresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    func updateButtonTapped(name: String, phone: String, username: String)
    init(view: ProfileViewController)
}

class ProfilePresenter: ProfilePresenterProtocol {
    var view: ProfileViewController?
    
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    required init(view: ProfileViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func updateButtonTapped(name: String, phone: String, username: String) {
        var request = URLRequest(url: URL(string: "http://localhost:8080/customers/\(UserData.customerId)")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "name": name,
            "phone": phone,
            "userId": UserData.userId
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
                self?.view?.showAlert(title: "Oops. Something went wrong")
                return
            }
            self?.view?.showAlert(title: "Woohoo. You successfully updater your info")
        }
    }
}
