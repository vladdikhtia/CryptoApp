//
//  Coin.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 12/03/2024.
//

import Foundation

struct Coin: Codable, Identifiable { 
    let id: String
    let symbol: String
    let name: String
//    let currentPrice: Double
//    let marketCapRank: Int
}
