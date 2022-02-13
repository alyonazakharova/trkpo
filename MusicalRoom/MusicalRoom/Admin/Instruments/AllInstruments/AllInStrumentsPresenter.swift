//
//  AllInStrumentsPresenter.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 13.02.2022.
//

import Foundation
import UIKit

protocol AllInstrumentsPresenterDelegate: AnyObject {
    func presentInstruments(instruments: [InstrumentModel])
}

typealias PresenterDelegateInstruments = AllInstrumentsPresenterDelegate & UIViewController

class AllInstrumentsPresenter {
    
    weak var delegate: PresenterDelegateInstruments?
    
    public func setViewDelegate(delegate: PresenterDelegateInstruments) {
        self.delegate = delegate
    }
    
    public func getInstruments() {
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
            self.delegate?.presentInstruments(instruments: receivedInstruments)
        }
        task.resume()
    }
    
    public func deleteInstrument(instrumentId: String) {
        var request = URLRequest(url: URL(string: .deleteInstrumentUrl + instrumentId)!)
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
            self.getInstruments()
        }
        task.resume()
    }
}
