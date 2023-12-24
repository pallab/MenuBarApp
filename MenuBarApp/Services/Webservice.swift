//
//  Webservice.swift
//  MenuBarApp
//
//  Created by Pallab Kalita on 24/12/23.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

class Webservice {
    func getStocks(url : URL) async throws -> [Stock] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
//        let jsdatat = String(data: data, encoding: .utf8)
//        print(jsdatat)
        return try JSONDecoder().decode([Stock].self, from: data)
    }
}
