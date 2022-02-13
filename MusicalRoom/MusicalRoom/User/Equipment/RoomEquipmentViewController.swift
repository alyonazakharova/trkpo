//
//  RoomEquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.02.2022.
//

import UIKit

class RoomEquipmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var instruments = [InstrumentModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RoomEquipmentTableViewCell.self, forCellReuseIdentifier: RoomEquipmentTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instruments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomEquipmentTableViewCell.identifier) as? RoomEquipmentTableViewCell
        
        let instrument = InstrumentModel(id: instruments[indexPath.row].id,
                                         name: instruments[indexPath.row].name,
                                         description: instruments[indexPath.row].description)
        cell?.configure(with: instrument)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
