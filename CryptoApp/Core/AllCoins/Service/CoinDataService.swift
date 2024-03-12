//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 12/03/2024.
//

import Foundation

class CoinDataService {
    
    
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
