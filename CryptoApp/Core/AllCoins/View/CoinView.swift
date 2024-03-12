//
//  CoinView.swift
//  CryptoApp
//
//  Created by Vladyslav Dikhtiaruk on 12/03/2024.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        HStack{
            Text("1") // \(coin.marketCapRank)
                .font(.callout)
                .foregroundStyle(.gray)
//                        AsyncImage(url: URL(string: coin.image)) { image in
//                            image
//                                .resizable()
//                                .scaledToFit()
//
//
//
//                        } placeholder: {
//                            Circle()
//
//                        }
            Circle()
                .frame(height: 40)
                
                
            VStack(alignment: .leading) {
                Text("Name") // coin.name
                    .font(.title3)
                    .bold()
                Text("Symbol") // coin.symbol
                    .foregroundStyle(.gray)

            }
            
        }    }
}

#Preview {
    CoinView()
}
