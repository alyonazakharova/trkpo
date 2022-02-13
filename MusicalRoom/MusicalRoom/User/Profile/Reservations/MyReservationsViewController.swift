//
//  MyReservationsViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 11.01.2022.
//

import UIKit

class MyReservationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MyReservationsPresenterDelegate {
    
    private let presenter = MyReservationsPresenter()
    
    var reservations = [ReservationModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyReservationTableViewCell.identifier) as? MyReservationTableViewCell
        
        cell?.deleteButton.tag = indexPath.row
        cell?.deleteButton.addTarget(self,action:#selector(deleteButtonTapped),for:.touchUpInside)
        
        let reservation = reservations[indexPath.row]
        cell?.configure(with: reservation)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyReservationTableViewCell.self, forCellReuseIdentifier: MyReservationTableViewCell.identifier)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        presenter.setViewDelegate(delegate: self)
        presenter.getReservations()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func presentReservations(reservations: [ReservationModel]) {
        self.reservations = reservations
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func deleteButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Delete reservation?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.presenter.deleteReservation(reservationId: String(self.reservations[sender.tag].id))
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
