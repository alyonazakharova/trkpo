//
//  AdminEqupmentPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 07.01.2022.
//

import Foundation

protocol AdminEquipmentPresenterProtocol: AnyObject {
    init(view: AdminEquipmentViewController)
    func loadRooms() -> [Room]
    func loadInstruments()
    func addEquipment(room: Room, instrument: InstrumentModel)
}


class AdminEquipmentPresenter: AdminEquipmentPresenterProtocol {
    var rooms = [Room]()
    var roomsNames = [String]()

    private let group = DispatchGroup()
    private var errorOccured: Bool
    
    var view: AdminEquipmentViewController?
    
    required init(view: AdminEquipmentViewController) {
        self.view = view
        self.errorOccured = false
    }
    
    func loadRooms() -> [Room] {
        return []
    }
    
    func loadInstruments() {
        
    }
    
    func addEquipment(room: Room, instrument: InstrumentModel) {        
        var request = URLRequest(url: URL(string: .addInstrumentToRoomUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(UserData.bearerToken)", forHTTPHeaderField: "Authorization")
        
        let body: [String: AnyHashable] = [
            "roomId": room.id,
            "instrumentId": instrument.id
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
        group.enter()
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if (httpResponse.statusCode != 200) {
                    self.errorOccured = true
                    print("UNSUCCESSFUL WITH CODE: \(httpResponse.statusCode)")
                }
            }
            self.group.leave()

        }
        task.resume()
        
        group.notify(queue: .main) { [weak self] in
            if (self?.errorOccured != nil && self?.errorOccured == true) {
                self?.view?.showAlert(title: "Oops. Something went wrong")
                return
            }
            self?.view?.showAlert(title: "Instrument was successfully added to the room")
        }
    }
}
