//
//  ContentView.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 10/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    @State private var isError = false
    
    var body: some View {
        VStack {
            List(viewModel.coins) { coin in
                Text(coin.name)
            }
        }
      
    }
}

#Preview {
    ContentView()
}
//56:17
