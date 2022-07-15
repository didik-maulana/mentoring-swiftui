//
//  HomeViewModel.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var popularGames: [Game] = []
    @Published var topRatedGames: [Game] = []
    
    @Published var isLoadingPopularGames: Bool = false
    @Published var isLoadingTopRatedGames: Bool = false
    
    @Published var errorMessage: String? = nil
    
    private let apiService = APIService()
    private var cancelables: Set<AnyCancellable> = []
    
    func loadPopularGames() {
        isLoadingPopularGames = true
        
        apiService.loadData(endpoint: "games", type: GameListResponse.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingPopularGames = false
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.popularGames = response.results
            }.store(in: &cancelables)
    }
    
    func loadTopRatedGames() {
        isLoadingTopRatedGames = true
        
        apiService.loadData(
            endpoint: "games",
            params: [
                URLQueryItem(name: "ordering", value: "-rating")
            ],
            type: GameListResponse.self
        )
        .receive(on: RunLoop.main)
        .sink { [weak self] completion in
            switch completion {
            case .finished:
                self?.isLoadingTopRatedGames = false
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] response in
            self?.topRatedGames = response.results
        }.store(in: &cancelables)
    }
}
