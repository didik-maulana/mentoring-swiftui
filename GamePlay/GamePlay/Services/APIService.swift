//
//  APIService.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/07/22.
//

import Alamofire
import Combine
import Foundation

class APIService {
    
    func loadData<D: Decodable>(
        endpoint: String,
        params: [URLQueryItem]? = nil,
        type: D.Type
    ) -> AnyPublisher<D, Error> {
        return Future<D, Error> { completion in
            guard let url = URL(string: "https://api.rawg.io/api/\(endpoint)") else {
                return
            }
            
            var queryParamaters: Parameters = [:]
            queryParamaters["key"] = "fe6e425621434f3390c554c30e670b38"
            params?.forEach { urlQuery in
                queryParamaters[urlQuery.name] = urlQuery.value
            }
            
            AF.request(url, method: .get, parameters: queryParamaters)
                .validate()
                .responseDecodable(of: type.self) { response in
                    switch response.result {
                    case .success(let result):
                        completion(.success(result))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }.eraseToAnyPublisher()
    }
}
