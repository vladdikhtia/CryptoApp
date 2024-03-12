//
//  CoinsViewModel.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 10/03/2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    //    @Published var coin = ""
    //    @Published var price = ""
    //    @Published var errorMessage: String?
    @Published var coins: [Coin] = []
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        //        fetchPrice(coin: "bitcoin", currency: "usd")
        fetchCoins()
    }
    func fetchCoins(){
//        service.fetchCoins { coins, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                    return
//                }
//                
//                self.coins = coins ?? []
//            }
//        }
        service.fetchCoinsWithResult { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    //    func fetchPrice(coin: String, currency: String) {
    //        service.fetchPrice(coin: coin, currency: currency) { priceFromService in
    //            DispatchQueue.main.async {
    //                self.price = "$\(priceFromService)"
    //                self.coin = coin
    //            }
    //        }
    //    }
    
    
}
