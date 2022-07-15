//
//  APIError.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 14/07/22.
//

enum APIError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case invalidData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "Failed to fetch data"
        case .invalidEndpoint:
            return "Invalid endpoint"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        case .serializationError:
            return "Failed to decode data"
        }
    }
}
