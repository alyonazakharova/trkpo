//
//  ViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import UIKit

class InitialViewController: UIViewController {
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.addTarget(self,action: #selector(loginButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.addTarget(self,action: #selector(signupButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setUI()
    }
    
    func setBackground(){
        let background = UIImage(named: "background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setUI() {
        view.addSubview(signupButton)
        signupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        view.addConstraint(NSLayoutConstraint(item: signupButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(loginButton)
        loginButton.bottomAnchor.constraint(equalTo: signupButton.topAnchor, constant: -10).isActive = true
        view.addConstraint(NSLayoutConstraint(item: loginButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func signupButtonTapped() {
        view.backgroundColor = .white
        let signupVc = SignUpViewController()
        navigationController?.pushViewController(signupVc, animated: false)
    }
    
    @objc private func loginButtonTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: false)
    }
}

