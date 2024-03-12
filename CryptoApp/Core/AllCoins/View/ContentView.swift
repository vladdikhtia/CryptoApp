//
//  ContentView.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
    
            
            List(viewModel.coins) { coin in
                HStack(spacing: 12) {
                    Text("\(coin.marketCapRank)")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.name)
                            .fontWeight(.semibold)
                        
                        Text(coin.symbol.uppercased())
                            
                    }
                }
                .font(.footnote)
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
           
      
    }
}

#Preview {
    ContentView()
}
//56:17
