//
//  NetworkLayer.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//

import Foundation

class NetworkLayer {
    
    func fetchList() async throws -> ListLeagues {
        let request = URLRequest(url: Constants.API.baseURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try self.decode(data: data)
    }
    private func decode<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
