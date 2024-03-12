//
//  CoinsViewModel.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 10/03/2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()

    init() {
        fetchPrice(coin: "bitcoin", currency: "usd")
    }
    
    func fetchPrice(coin: String, currency: String) {
        service.fetchPrice(coin: coin, currency: currency) { priceFromService in
            DispatchQueue.main.async {
                self.price = "$\(priceFromService)"
                self.coin = coin
            }
        }
    }
    
    
}
