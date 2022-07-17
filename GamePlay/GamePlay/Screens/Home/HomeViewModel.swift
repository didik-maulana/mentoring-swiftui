//
//  HomeViewModel.swift
//  GamePlay
//
//  Created by Didik on 25/06/22.
//

import Combine
import Foundation

///***
///ObservableObject untuk membuat object viewModel dapat di observe / subscribe,
///sehingga ketika ada perubahan pada variable dengan tipe Published dapat memberikan notifikasi ke UI
class HomeViewModel: ObservableObject {
    ///***
    /// @Published membuat suatu variable selain dapat get, set, juga dapat memberikan notifikasi ketika ada perubahan value
    @Published var popularGames: [Game] = []
    @Published var topRatedGames: [Game] = []
    
    @Published var isLoadingPopularGames: Bool = true
    @Published var isLoadingTopRatedGames: Bool = true
    
    @Published var errorMessage: String? = nil
    
    private let apiService = APIService()
    
    ///***
    /// AnyCancellable sebagai penyimpanan dari service yang sudah dijalankan,
    /// kemudian service yang sudah selesai akan dicancel / clear setiap class sudah deinit dari memori
    private var cancelables: Set<AnyCancellable> = []
    
    func loadPopularGames() {
        isLoadingPopularGames = true
        
        apiService.loadData(endpoint: "games", type: GameListResponse.self)
            .receive(on: RunLoop.main) // menerima response dijalankan di main thread, kemudian dirender oleh UI
            .sink { [weak self] completion in
                switch completion {
                case .finished: // ke trigger ketika proses call API sudah selesai
                    self?.isLoadingPopularGames = false
                case .failure(let error): // ke trigger ketika proses call API terdapat error
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] response in // ke trigger ketika mendapatkan value dari response (sukses)
                ///***
                /// weak self artinya menggunakan self sebagai referensi yang lemah, sehingga ketika proses receiveValue sudah selesai
                /// bisa langsung dihapus dari memori
                ///
                /// Referensi tentang weak reference di link berikut:
                /// https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
                /// https://www.programiz.com/swift-programming/strong-weak-reference
                self?.popularGames = response.results
            }.store(in: &cancelables)
    }
    
    func loadTopRatedGames() {
        isLoadingTopRatedGames = true
        
        apiService.loadData(
            endpoint: "games",
            queries: [
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
