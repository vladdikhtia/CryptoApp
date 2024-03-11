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
    
    init() {
        fetchPrice(coin: "bitcoin", currency: "usd")
        fetchPrice(coin: "litecoin", currency: "usd")
    }
    
    func fetchPrice(coin: String, currency: String) {
        print(Thread.current)
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=\(currency)"
        guard let url = URL(string: urlString) else { return }
        
        
        print("Fetching price...") // 1
        
        URLSession.shared.dataTask(with: url) { data, response, error in // asynchronausly // background thread
            print(Thread.current)
            print("Did receive data \(data)") // 3
            guard let data = data else { return }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            print("JSON \(jsonObject)")
            guard let value = jsonObject[coin] as? [String: Double] else { return } // casting? check it out later
            print(value)
            print(type(of: value))
            guard let price = value[currency] else { return }
            
            DispatchQueue.main.async {
                print(Thread.current)
                self.coin = coin.capitalized
                self.price = "$\(price)" //change sign
            }
            
        }.resume()
        
        print("Did reach end of function...") // 2
    }
}
