//
//  LoginViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.12.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var presenter: LoginPresenterProtocol?

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.cornerRadius = 10
        field.placeholder = "password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .done
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(loginButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        setBackground()
        setUI()
    }
    
    func setBackground(){
        let background = UIImage(named: "signup-bg")
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
        // USERNAME
        view.addSubview(usernameField)
        view.addConstraint(NSLayoutConstraint(item: usernameField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        usernameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(usernameLabel)
        usernameLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -5).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
       
        // PASSWORD
        view.addSubview(passwordField)
        view.addConstraint(NSLayoutConstraint(item: passwordField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 60).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true

        view.addSubview(passwordLabel)
        passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -5).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // BUTTON
        view.addSubview(loginButton)
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func loginButtonTapped() {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let username = usernameField.text,
              let password = passwordField.text,
              !username.isEmpty,
              !password.isEmpty
        else {
            let alert = UIAlertController(title: "Ooops!",
                                          message: "Please, fill all the fields",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        presenter?.loginButtonTapped(username: username, password: password)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ooops. Seems like you entered wrong username or password", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

        }))

        present(alert, animated: true, completion: nil)
    }
}
