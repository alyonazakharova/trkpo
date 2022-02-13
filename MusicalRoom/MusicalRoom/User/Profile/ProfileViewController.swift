//
//  ProfileViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 19.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var presenter: ProfilePresenterProtocol?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "phone"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("Refresh", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(updateButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let myReservationsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("My Reservations", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(myReservationsButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(logoutButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view: self)
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
        // NAME
        view.addSubview(nameField)
        view.addConstraint(NSLayoutConstraint(item: nameField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nameField.text = UserData.name
        
        view.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // PHONE
        view.addSubview(phoneField)
        view.addConstraint(NSLayoutConstraint(item: phoneField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 60).isActive = true
        phoneField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        phoneField.text = UserData.phone
        
        view.addSubview(phoneLabel)
        phoneLabel.bottomAnchor.constraint(equalTo: phoneField.topAnchor, constant: -5).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        // BUTTONS
        view.addSubview(logoutButton)
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        view.addConstraint(NSLayoutConstraint(item: logoutButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(myReservationsButton)
        myReservationsButton.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -10).isActive = true
        view.addConstraint(NSLayoutConstraint(item: myReservationsButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        myReservationsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myReservationsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(updateButton)
        updateButton.bottomAnchor.constraint(equalTo: myReservationsButton.topAnchor, constant: -10).isActive = true
        view.addConstraint(NSLayoutConstraint(item: updateButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func updateButtonTapped() {
        guard let name = nameField.text,
              let phone = phoneField.text,
              !name.isEmpty,
              !phone.isEmpty
        else {
            let alert = UIAlertController(title: "Ooops!",
                                          message: "You didn't fill some info about yourself",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        presenter?.updateButtonTapped(name: name, phone: phone, username: UserData.username)
    }
    
    @objc private func myReservationsButtonTapped() {
        let vc = MyReservationsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func logoutButtonTapped() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "loginVC") as! UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
