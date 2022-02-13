//
//  EquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 14.12.2021.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EquipmentPresenterDelegate {
    
    private let presenter = EquipmentPresenter()
    
    var rooms = [RoomModel]()
    
    var roomInstrumnets = [InstrumentModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EquipmentTableViewCell.identifier) as? EquipmentTableViewCell
        
        let room = RoomModel(id: rooms[indexPath.row].id,
                             name: rooms[indexPath.row].name,
                             description: rooms[indexPath.row].description,
                             price: rooms[indexPath.row].price)
        cell?.configure(with: room)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EquipmentTableViewCell.self, forCellReuseIdentifier: EquipmentTableViewCell.identifier)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        presenter.setViewDelegate(delegate: self)
        presenter.getRooms()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func presentRooms(rooms: [RoomModel]) {
        self.rooms = rooms
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRoom = rooms[indexPath.row]
        print(selectedRoom.id)
        print(selectedRoom.name)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "roomEquipmentVC") as? RoomEquipmentViewController
        
        var request = URLRequest(url: URL(string: "http://localhost:8080/rooms/\(selectedRoom.id)/instruments")!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            
            let instruments = try? JSONDecoder().decode([InstrumentModel].self, from: data)
            self?.roomInstrumnets = instruments!
            vc?.instruments = self!.roomInstrumnets
            
            dispatchGroup.leave()
        }
        task.resume()
        
        dispatchGroup.notify(queue: .main) {
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
