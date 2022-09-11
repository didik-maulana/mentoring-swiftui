//
//  SearchViewModel.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 28/08/22.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    
    @Published private (set) var gameList: [Game] = []
    @Published private (set) var isLoading: Bool = false
    
    private (set) var isEmptySearch: Bool = false
    
    private let apiService = APIService()
    private var cancelables: Set<AnyCancellable> = []
    
    func searchGame(keyword: String) {
        guard !keyword.isEmpty else {
            gameList = []
            return
        }
        isLoading = true
        
        apiService
            .loadData(endpoint: "games?search=\(keyword)", type: GameListResponse.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] response in
                self?.isEmptySearch = response.results.isEmpty
                self?.gameList = response.results
            }.store(in: &cancelables)
    }
}
