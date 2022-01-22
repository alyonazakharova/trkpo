//
//  AllInstrumentsViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 04.01.2022.
//

import UIKit

class AllInstrumentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var instruments = [InstrumentModel]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instruments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InstrumentTableViewCell.identifier) as? InstrumentTableViewCell
        
        cell?.deleteButton.tag = indexPath.row
        cell?.deleteButton.addTarget(self,action:#selector(deleteButtonTapped),for:.touchUpInside)
        
        let instrument = instruments[indexPath.row]
        cell?.configure(with: instrument)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InstrumentTableViewCell.self, forCellReuseIdentifier: InstrumentTableViewCell.identifier)
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
        let alert = UIAlertController(title: "Delete instrument?", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            var request = URLRequest(url: URL(string: .deleteInstrumentUrl + String(self.instruments[sender.tag].id))!)
            
            request.httpMethod = "DELETE"
            request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
                guard error == nil else {
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    if (httpResponse.statusCode != 200) {
                        print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                        return
                    }
                }
                DispatchQueue.main.async {
                    instruments.remove(at: sender.tag)
                    self.tableView.reloadData()
                    showAlert(title: "Instrument was successfully deleted")
                }
            }
            task.resume()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func loadContent() {
        var request = URLRequest(url: URL(string: .getAllInstrumentsUrl)!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            guard let receivedInstruments = try? JSONDecoder().decode([InstrumentModel].self, from: data) else {
              print("Error: Couldn't decode data")
              return
            }
            self.instruments = receivedInstruments
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
