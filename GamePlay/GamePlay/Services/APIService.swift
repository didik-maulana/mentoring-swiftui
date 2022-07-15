//
//  APIService.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/07/22.
//

import Combine
import Foundation

class APIService {
    
    func loadData<D: Decodable>(
        endpoint: String,
        params: [URLQueryItem]? = nil,
        type: D.Type
    ) -> AnyPublisher<D, APIError> {
        return Future<D, APIError> { completion in
            // Creating mutable URL components
            guard let url = URL(string: "https://api.rawg.io/api/\(endpoint)"),
                  var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                completion(.failure(.invalidEndpoint))
                return
            }
            
            // Add query parameter in URL
            // Example: ?key=apiKey&category=top_rated
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "key", value: "fe6e425621434f3390c554c30e670b38")
            ]
            if let params = params {
                queryItems.append(contentsOf: params)
            }
            urlComponents.queryItems = queryItems

            // Get final URL
            guard let finalURL = urlComponents.url else {
                completion(.failure(.invalidEndpoint))
                return
            }
            
            // Create request API task with callback response
            let requestTask = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
                // Check if error
                guard error == nil else {
                    completion(.failure(.apiError))
                    return
                }
                
                // Check if data exists
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                // Decode JSON to swift object
                do {
                    let decodedResponse = try JSONDecoder().decode(D.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(.serializationError))
                }
            }
            requestTask.resume() // Start requestTask to call API
        }.eraseToAnyPublisher() // type-eraser publisher
    }
}
