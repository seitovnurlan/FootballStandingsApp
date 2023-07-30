//
//  NetworkLayer.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//
import Foundation

class NetworkLayer {
    
//    func fetchList() async throws -> ListLeagues {
//        let request = URLRequest(url: Constants.API.baseURL)
//        let (data, _) = try await URLSession.shared.data(for: request)
//        return try self.decode(data: data)
//    }
//    private func decode<T: Decodable>(data: Data) throws -> T {
//        return try JSONDecoder().decode(T.self, from: data)
//    }
 
    func fetchList(completion: @escaping (Result<ListLeagues, Error>) -> Void) {
        
        guard let baseURL = URL(string: "https://api-football-standings.azharimm.dev/leagues") else {return}
        
        let request = URLRequest(url: baseURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            do {
                let model = try JSONDecoder().decode(ListLeagues.self, from: data)
                completion(.success(model))
            }
            catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
