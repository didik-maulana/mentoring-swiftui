//
//  APIError.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 16/07/22.
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
            return "Failed to fetch data."
        case .invalidEndpoint:
            return "Invalid endpoint URL."
        case .invalidResponse:
            return "Invalid from response."
        case .invalidData:
            return "Invalid data."
        case .serializationError:
            return "Failed to decode data."
        }
    }
}
