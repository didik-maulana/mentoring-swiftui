//
//  GameDetailViewModel.swift
//  GamePlay
//
//  Created by Didik Maulana Ardiansyah on 22/07/22.
//

import Combine
import Foundation

class GameDetailViewModel: ObservableObject {
    
    @Published private (set) var game: Game? = nil
    @Published private (set) var isLoading: Bool = true
    @Published private (set) var errorMessage: String? = nil
    
    private let apiService = APIService()
    private var cancelables: Set<AnyCancellable> = []
    
    func loadGameDetail(gameID: Int) {
        isLoading = true
        apiService.loadData(endpoint: "games/\(gameID)", type: Game.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in
                self?.game = response
            }.store(in: &cancelables)
    }
}
