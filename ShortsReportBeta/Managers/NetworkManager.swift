//
//  NetworkManager.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    
    func fetchData(from urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                    print(error!.localizedDescription)
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
    
}


enum NetworkError: Error {
    case badURL, requestFailed, unknown
}
