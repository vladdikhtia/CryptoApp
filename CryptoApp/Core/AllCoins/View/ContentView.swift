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
            if let errorMessage = viewModel.errorMessage {
                Text(viewModel.errorMessage!)
                    .multilineTextAlignment(.center)
                    
            } else {
                Text("\(viewModel.coin): \(viewModel.price)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
//56:17
