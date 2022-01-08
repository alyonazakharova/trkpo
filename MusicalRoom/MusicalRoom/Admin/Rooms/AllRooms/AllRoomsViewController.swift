//
//  AllRoomsViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit

class AllRoomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var rooms = [RoomModel]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.identifier) as? RoomTableViewCell
        
        cell?.deleteButton.tag = indexPath.row
        cell?.deleteButton.addTarget(self,action:#selector(deleteButtonTapped),for:.touchUpInside)
        
        let room = rooms[indexPath.row]
        cell?.configure(with: room)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RoomTableViewCell.self, forCellReuseIdentifier: RoomTableViewCell.identifier)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContent()
        
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func deleteButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Delete room?", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //todo
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func loadContent() {
        var request = URLRequest(url: URL(string: .getAllRoomsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            guard let receivedRooms = try? JSONDecoder().decode([RoomModel].self, from: data) else {
              print("Error: Couldn't decode data")
              return
            }
            self.rooms = receivedRooms
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
