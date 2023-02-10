//
//  MainView.swift
//  AsyncImage
//
//  Created by Tatiana Bondarenko on 2/9/23.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var cryptoListViewModel: CryptoListViewModel

    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }

    var body: some View {
        NavigationView {
            List(cryptoListViewModel.cryptoList, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price)
                        .font(.body)
                        .foregroundColor(.yellow)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button {
                    Task.init {
                        await cryptoListViewModel.downloadCryptosAndContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("Refresh")
                }

            })
            .navigationTitle("Crypto Crazy")
        }
        .task({
            await cryptoListViewModel.downloadCryptosAndContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        })
//        .task({
//            await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
//        })
//        .onAppear {
//            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
