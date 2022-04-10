//
//  RoomsViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit

class RoomsViewController: UIViewController, UITextFieldDelegate {
    
    var presenter: RoomsPresenterProtocol?

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
        field.returnKeyType = .done
        field.layer.cornerRadius = 10
        field.placeholder = "Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        field.layer.cornerRadius = 10
        field.placeholder = "Description"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceField: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 10
        field.placeholder = "Price"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let addRoomButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Add Room", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(addRoomButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewRoomsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("View Rooms", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(viewRoomsButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RoomsPresenter(view: self)
        self.nameField.delegate = self
        self.descriptionField.delegate = self
        self.priceField.delegate = self
        setBackground()
        setUI()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setBackground(){
        let background = UIImage(named: "admin-bg")
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
        
        view.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
       
        
        // DESCTIPTION
        view.addSubview(descriptionField)
        view.addConstraint(NSLayoutConstraint(item: descriptionField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        descriptionField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 60).isActive = true
        descriptionField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionField.topAnchor, constant: -5).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        
        // PRICE
        view.addSubview(priceField)
        view.addConstraint(NSLayoutConstraint(item: priceField,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        priceField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 60).isActive = true
        priceField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(priceLabel)
        priceLabel.bottomAnchor.constraint(equalTo: priceField.topAnchor, constant: -5).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        
        // BUTTONS
        view.addSubview(viewRoomsButton)
        viewRoomsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        view.addConstraint(NSLayoutConstraint(item: viewRoomsButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        viewRoomsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewRoomsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(addRoomButton)
        addRoomButton.bottomAnchor.constraint(equalTo: viewRoomsButton.topAnchor, constant: -10).isActive = true
        view.addConstraint(NSLayoutConstraint(item: addRoomButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        addRoomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addRoomButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func addRoomButtonTapped() {
        nameField.resignFirstResponder()
        descriptionField.resignFirstResponder()
        priceField.resignFirstResponder()
        
        guard let name = nameField.text,
              let description = descriptionField.text,
              let price: Int? = Int(priceField.text!) ?? 0,
              !name.isEmpty,
              !description.isEmpty,
              price != 0
        else {
            let alert = UIAlertController(title: "Ooops!",
                                          message: "Please, check that you filled all the fields correctly",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        presenter?.addNewRoom(name: name, description: description, price: price!)
    }
    
    @objc private func viewRoomsButtonTapped() {
        let allRoomsVC = AllRoomsViewController()
        navigationController?.pushViewController(allRoomsVC, animated: true)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
