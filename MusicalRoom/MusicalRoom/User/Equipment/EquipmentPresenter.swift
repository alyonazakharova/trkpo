//
//  EquipmentPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import Foundation

protocol EquipmentPresenterProtocol: AnyObject {
    
    func loadContent()
    init(view: EquipmentViewController)
}

class EquipmentPresenter: EquipmentPresenterProtocol {    
    var content: [Equipment]
    
    var view: EquipmentViewController?
    
    required init(view: EquipmentViewController) {
        self.view = view
        self.content = []
    }
    
    func loadContent() {
        print("loadContent called")
        var request = URLRequest(url: URL(string: "http://localhost:8080/rooms/all")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data else {
                return
            }
            
            let equipmentArray = try? JSONDecoder().decode([Equipment].self, from: data)
            self.content = equipmentArray ?? []
            print(content)
     
        }
        task.resume()
    }
}
