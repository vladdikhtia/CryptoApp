//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 12/03/2024.
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    func fetchCoins(completion: @escaping([Coin]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
                print("DEBUG: Failed to decode coins")
                return
            }
            print("DEBUG: Coins decoded:\n \(coins)")
            for coin in coins {
                print("DEBUG: Coin name is: \(coin.name)")
            }
            
            completion(coins)
        }.resume()
    }
    
    func fetchPrice(coin: String, currency: String, completion: @escaping(Double) -> Void ) { // competion handler allow us to pass thiings from one components to another in our code
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=\(currency)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in // asynchronausly // background thread
            if let error = error {
                print("DEBUG: Failed with error \(error.localizedDescription)")
                //                    self.errorMessage = error.localizedDescription
                return
                
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                //                self.errorMessage = "Bad HTTP Response"
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                //                self.errorMessage = "Failed to fetch with status code: \(httpResponse.statusCode)"
                return
            }
            
            guard let data = data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            guard let value = jsonObject[coin] as? [String: Double] else { // casting? check it out later
                print("Failed to pass value")
                return
            }
            guard let price = value[currency] else { return }
            
            print("DEBUG: Price in servise is: \(price)")
            completion(price)
        }.resume()
    }
}
