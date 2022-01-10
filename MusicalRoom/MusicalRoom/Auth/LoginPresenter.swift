//
//  LoginPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    func loginButtonTapped(username: String, password: String)
    init(view: LoginViewController)
}

class LoginPresenter: LoginPresenterProtocol {
    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: LoginViewController?
    
    required init(view: LoginViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func loginButtonTapped(username: String, password: String) {
        var request = URLRequest(url: URL(string: .signInUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "userName": username,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        group.enter()
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SignInResponse.self, from: data)
                print("Token: \(response.token)")
                print("User id: \(response.userId)")
                print("Customer id: \(response.customerId)")
                UserData.userId = response.userId
                UserData.bearerToken = response.token
                UserData.customerId = response.customerId
                
            } catch {
                self.errorOccured = true
            }
            self.group.leave()

        }
        task.resume()
        
        group.notify(queue: .main) { [weak self] in
            if (self?.errorOccured != nil && self?.errorOccured == true) {
                self?.view?.showAlert()
                return
            }
            let isAdmin = username == "admin"
            self?.navigateToMainScreen(isAdmin: isAdmin)
        }
    }
    
    func navigateToMainScreen(isAdmin: Bool) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        var view: UIViewController
        if (isAdmin) {
            view = storyboard.instantiateViewController(withIdentifier: "adminTabBar") as! UIViewController
        } else {
            view = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UIViewController
        }
        
        view.modalPresentationStyle = .fullScreen
        self.view?.present(view, animated: true, completion: nil)
    }
}
