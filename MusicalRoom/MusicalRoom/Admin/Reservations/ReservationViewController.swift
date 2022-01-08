//
//  ReservationViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 08.01.2022.
//

import UIKit

class ReservationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: ReservationPresenterProtocol?
    
    var reservations = [ReservationModel]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReservationTableViewCell.identifier) as? ReservationTableViewCell
        
        cell?.confirmButton.tag = indexPath.row
        cell?.confirmButton.addTarget(self,action:#selector(confrirmButtonTapped),for:.touchUpInside)
        
        let reservation = reservations[indexPath.row]
        cell?.configure(with: reservation)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ReservationTableViewCell.self, forCellReuseIdentifier: ReservationTableViewCell.identifier)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ReservationPresenter(view: self)
        
        loadContent()
        
        tableView.backgroundColor = .link
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func confrirmButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Confirm reservation?", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //todo
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func loadContent() {
        var request = URLRequest(url: URL(string: .getAllReservationsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            guard let receivedReservations = try? JSONDecoder().decode([ReservationModel].self, from: data) else {
              print("Error: Couldn't decode data")
              return
            }
            self.reservations = receivedReservations
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
