//
//  APIService.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 16/07/22.
//

import Combine
import Foundation

class APIService {
    // <D: Decodable> is generic
    // Referensi tentang generic https://docs.swift.org/swift-book/LanguageGuide/Generics.html
    // https://www.hackingwithswift.com/plus/intermediate-swift/understanding-generics-part-1
    func loadData<D: Decodable>(
        endpoint: String,
        queries: [URLQueryItem]? = nil,
        type: D.Type
    ) -> AnyPublisher<D, APIError> {
        return Future<D, APIError> { completion in
            // Membuat URL dan cek apakah endpoint url valid
            guard let url = URL(string: "https://api.rawg.io/api/\(endpoint)"),
                  var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                completion(.failure(.invalidEndpoint)) // apabila url tidak valid mengembalikan invalidEndpoint error
                return
            }
            
            // Menambahkan URL query
            // Contoh: ?key=fe6e425621434f3390c554c30e670b38&ordering=released
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "key", value: "fe6e425621434f3390c554c30e670b38")
            ]
            if let queryList = queries {
                queryItems.append(contentsOf: queryList)
            }
            urlComponents.queryItems = queryItems
            
            // Mendapatkan final URL dan cek apakah valid
            guard let finalURL = urlComponents.url else {
                completion(.failure(.invalidEndpoint)) // apabila url tidak valid mengembalikan invalidEndpoint error
                return
            }
            
            // Membuat request untuk memanggil API sesuai URL dan mendapatkan response
            let requestTask = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
                // Cek apakah ada error
                guard error == nil else {
                    completion(.failure(.apiError)) // apabila ada error mengembalikan apiError
                    return
                }
                
                // Cek apakah ada data
                guard let validData = data else {
                    completion(.failure(.invalidData)) // apabila tidak ada data mengembalikan invalidData
                    return
                }
                
                // Convert JSON menjadi Swift Object / Model
                do {
                    let decodedResponse = try JSONDecoder().decode(D.self, from: validData)
                    completion(.success(decodedResponse)) // apabila berhasil convert mengembalikan sukses dengan membawa data berupa object atau model
                } catch {
                    completion(.failure(.serializationError)) // apabila gagal convert JSON menjadi model mengembalikan serializationError
                }
            }
            requestTask.resume() // Menjalankan request untuk memanggil API
        }.eraseToAnyPublisher() // type-erase publisher
    }
}
