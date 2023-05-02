//
//  NetworkManager.swift
//  Planetree
//
//  Created by Haroon Maqsood on 8/30/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var arrayOfData = [PlanetsModel]()
    
    func serviceCall() {
        let headers = [
            "X-RapidAPI-Key": "5194201a3bmsh928637328850ba0p182511jsn0f4e7f599df9",
            "X-RapidAPI-Host": "planets-info-by-newbapi.p.rapidapi.com"
        ]
        var request = URLRequest(url: URL(string: Api.url.rawValue)!)
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error with url \(String(describing: error))")
            }
            if let data = data {
                do {
                    let decoder = try JSONDecoder().decode([PlanetsModel].self, from: data)
                    DispatchQueue.main.async {
                    self.arrayOfData = decoder
                    }
                }
                catch {
                   print("Error while decoding \(String(describing: error))")
                }
            }
        }.resume()
    }
    
}

enum Api: String {
    case url = "https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planet/list"
}
