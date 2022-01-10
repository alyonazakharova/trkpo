//
//  EquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 14.12.2021.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let group = DispatchGroup()
    
    var content = [Equipment]()
    //fixme
    private var presenter: EquipmentPresenter?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EquipmentTableViewCell.identifier) as? EquipmentTableViewCell
        
        let equipment = Equipment(id: content[indexPath.row].id,
                                  name: content[indexPath.row].name,
                                  description: content[indexPath.row].description,
                                  price: content[indexPath.row].price)
        cell?.configure(with: equipment)
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
        
        loadContent()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func loadContent() {
        group.enter()
        var request = URLRequest(url: URL(string: "http://localhost:8080/rooms/all")!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            let equipmentArray = try? JSONDecoder().decode([Equipment].self, from: data)
            self.content = equipmentArray ?? []
            group.leave()
        }
        task.resume()
        group.notify(queue: .main) { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
