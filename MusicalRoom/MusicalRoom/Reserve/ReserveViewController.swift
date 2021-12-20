//
//  ReserveViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import UIKit
import DropDown

class ReserveViewController: UIViewController {
    private let group = DispatchGroup()
    var presenter: ReservePresenterProtocol?
    
    var selectedRoom: Room?
    var selectedDate: Date?
    var rooms = [Room]()
    var roomsNames = [String]()
    
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "Room"
        label.textColor = .white
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectRoomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Room", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,action: #selector(selectRoomButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .white
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let datePicker = UIDatePicker()
    
    private let reserveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("Reserve", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self,action: #selector(reserveButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ReservePresenter(view: self)
        
        setBackground()
        setUI()
        
        loadRooms()
        
        dropDown.anchorView = roomView
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectRoomButton.setTitle(roomsNames[index], for: .normal)
            selectedRoom = rooms[index]
        }
    }
    
    func setBackground(){
        let background = UIImage(named: "reserve-bg")
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
        // ROOM
        view.addSubview(roomLabel)
        roomLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        roomLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        roomView.addSubview(selectRoomButton)
        
        view.addSubview(roomView)
        roomView.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 5).isActive = true
        roomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        roomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        roomView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        selectRoomButton.topAnchor.constraint(equalTo: roomView.topAnchor, constant: 0).isActive = true
        selectRoomButton.bottomAnchor.constraint(equalTo: roomView.bottomAnchor, constant: 0).isActive = true
        selectRoomButton.leftAnchor.constraint(equalTo: roomView.leftAnchor, constant: 0).isActive = true
        selectRoomButton.rightAnchor.constraint(equalTo: roomView.rightAnchor, constant: 0).isActive = true
        
        // DATE
        view.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: roomView.bottomAnchor, constant: 30).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        view.addSubview(dateField)
        dateField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        dateField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        dateField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        dateField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        
        dateField.inputAccessoryView = toolBar
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
        
        // RESERVE BUTTON
        view.addSubview(reserveButton)
        reserveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        view.addConstraint(NSLayoutConstraint(item: reserveButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        reserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reserveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //todo вынести в презентер
    func loadRooms() {
        group.enter()
        var request = URLRequest(url: URL(string: "http://localhost:8080/rooms/all")!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                return
            }
            
            let roomsArray = try? JSONDecoder().decode([Room].self, from: data)
            self.rooms = roomsArray ?? []
            group.leave()
        }
        task.resume()
        group.notify(queue: .main) { [weak self] in
            self?.fillDropDown()
        }
    }
    
    func fillDropDown() {
        roomsNames = rooms.map { $0.name }
        dropDown.dataSource = roomsNames
    }
    
    @objc private func selectRoomButtonTapped() {
        dropDown.show()
    }
    
    @objc private func doneButtonTapped() {
        let formatter = DateFormatter()
        formatter.dateFormat = "y-M-d"
        selectedDate = datePicker.date
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    @objc private func reserveButtonTapped() {
        if (selectedRoom != nil && selectedDate != nil) {
            presenter?.reserveButtonTapped(roomId: selectedRoom!.id, date: dateField.text!)
        } else {
        showAlert(title: "Ooops. You didn't fill something")
        }
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Woohoo. You successfully reserved a room", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
