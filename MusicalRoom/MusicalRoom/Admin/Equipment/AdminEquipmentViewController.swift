//
//  AdminEquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit
import DropDown

class AdminEquipmentViewController: UIViewController {
    
    let group = DispatchGroup()
    var presenter: AdminEquipmentPresenterProtocol?
    var rooms = [Room]()
    var roomsNames = [String]()
    var selectedRoom: Room?
    
    var instruments = [InstrumentModel]()
    var instrumentsNames = [String]()
    var selectedInstrument: InstrumentModel?
    
    private let instrumentLabel: UILabel = {
        let label = UILabel()
        label.text = "Instrument"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instrumentView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldBgColor
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectInstrumentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Instrument", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,action: #selector(selectInstrumentButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "Room"
        label.textColor = .black
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roomView: UIView = {
        let view = UIView()
        view.backgroundColor = .textFieldBgColor
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
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Add Equipment", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 20)
        button.backgroundColor = .darkGray
        button.addTarget(self,action: #selector(addButtontapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let roomsDropDown = DropDown()
    private let instrumentsDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AdminEquipmentPresenter(view: self)
        setBackground()
        setUI()
        
        loadRooms()
        loadInstruments()
        
        roomsDropDown.anchorView = roomView
        roomsDropDown.bottomOffset = CGPoint(x: 0, y:(roomsDropDown.anchorView?.plainView.bounds.height)!)
        roomsDropDown.topOffset = CGPoint(x: 0, y:-(roomsDropDown.anchorView?.plainView.bounds.height)!)
        roomsDropDown.direction = .bottom
        roomsDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectRoomButton.setTitle(roomsNames[index], for: .normal)
            selectedRoom = rooms[index]
        }
        
        instrumentsDropDown.anchorView = instrumentView
        instrumentsDropDown.bottomOffset = CGPoint(x: 0, y:(instrumentsDropDown.anchorView?.plainView.bounds.height)!)
        instrumentsDropDown.topOffset = CGPoint(x: 0, y:-(instrumentsDropDown.anchorView?.plainView.bounds.height)!)
        instrumentsDropDown.direction = .bottom
        instrumentsDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.selectInstrumentButton.setTitle(instrumentsNames[index], for: .normal)
            selectedInstrument = instruments[index]
        }
    }
    
    func setBackground() {
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
        // INSTRUMENT
        view.addSubview(instrumentLabel)
        instrumentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        instrumentLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        instrumentView.addSubview(selectInstrumentButton)
        
        view.addSubview(instrumentView)
        instrumentView.topAnchor.constraint(equalTo: instrumentLabel.bottomAnchor, constant: 5).isActive = true
        instrumentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        instrumentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        instrumentView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        selectInstrumentButton.topAnchor.constraint(equalTo: instrumentView.topAnchor, constant: 0).isActive = true
        selectInstrumentButton.bottomAnchor.constraint(equalTo: instrumentView.bottomAnchor, constant: 0).isActive = true
        selectInstrumentButton.leftAnchor.constraint(equalTo: instrumentView.leftAnchor, constant: 0).isActive = true
        selectInstrumentButton.rightAnchor.constraint(equalTo: instrumentView.rightAnchor, constant: 0).isActive = true
        
        
        // ROOM
        view.addSubview(roomView)
        roomView.topAnchor.constraint(equalTo: instrumentView.bottomAnchor, constant: 60).isActive = true
        roomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        roomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        roomView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(roomLabel)
        roomLabel.bottomAnchor.constraint(equalTo: roomView.topAnchor, constant: -5).isActive = true
        roomLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        roomView.addSubview(selectRoomButton)
        selectRoomButton.topAnchor.constraint(equalTo: roomView.topAnchor, constant: 0).isActive = true
        selectRoomButton.bottomAnchor.constraint(equalTo: roomView.bottomAnchor, constant: 0).isActive = true
        selectRoomButton.leftAnchor.constraint(equalTo: roomView.leftAnchor, constant: 0).isActive = true
        selectRoomButton.rightAnchor.constraint(equalTo: roomView.rightAnchor, constant: 0).isActive = true
        
        
        // BUTTON
        view.addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        view.addConstraint(NSLayoutConstraint(item: addButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func loadRooms() {
        group.enter()
        var request = URLRequest(url: URL(string: .getAllRoomsUrl)!)
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
            self?.fillRoomsDropDown()
        }
    }
    
    func loadInstruments() {
        group.enter()
        var request = URLRequest(url: URL(string: .getAllInstrumentsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                return
            }
            
            let receivedInstruments = try? JSONDecoder().decode([InstrumentModel].self, from: data)
            self.instruments = receivedInstruments ?? []
            group.leave()
        }
        task.resume()
        group.notify(queue: .main) { [weak self] in
            self?.fillInstrumentsDropDown()
        }
    }
    
    func fillRoomsDropDown() {
        roomsNames = rooms.map { $0.name }
        roomsDropDown.dataSource = roomsNames
    }
    
    
    func fillInstrumentsDropDown() {
        instrumentsNames = instruments.map { $0.name }
        instrumentsDropDown.dataSource = instrumentsNames
    }
    
    @objc private func selectRoomButtonTapped() {
        roomsDropDown.show()
    }
    
    @objc private func selectInstrumentButtonTapped() {
        instrumentsDropDown.show()
    }
    
    @objc private func addButtontapped() {
        presenter?.addEquipment(room: selectedRoom!, instrument: selectedInstrument!)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
