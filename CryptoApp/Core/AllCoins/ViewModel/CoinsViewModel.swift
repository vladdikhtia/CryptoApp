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
        service.fetchCoinsWithResult { [weak self] result in // all referenses in class, are weak instead of strong, this block is self contain peace of code
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins // weak refernce
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription // weak refernce
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
