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
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private let appearanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Appearance"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        //        headerView.backgroundColor = .systemPink
        
        headerView.addSubview(appearanceLabel)
        appearanceLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        appearanceLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        
        headerView.addSubview(nameLabel)
        nameLabel.rightAnchor.constraint(equalTo: appearanceLabel.leftAnchor, constant: -50).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        
        headerView.addSubview(priceLabel)
        priceLabel.leftAnchor.constraint(equalTo: appearanceLabel.rightAnchor, constant: 50).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContent()
        
        //        tableView.backgroundColor = .link
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
                print(error)
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
