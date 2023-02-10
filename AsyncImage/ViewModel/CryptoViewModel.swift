//
//  CryptoViewModel.swift
//  AsyncImage
//
//  Created by Tatiana Bondarenko on 2/9/23.
//

import Foundation

// with this we don't need DispatchQueue.main for cryptoList = cryptos.map(CryptoViewModel.init)!!!!!
@MainActor
class CryptoListViewModel: ObservableObject {

    @Published var cryptoList = [CryptoViewModel]()

    let webService = WebService()

    func downloadCryptosAndContinuation(url: URL) async {
        do {
            let cryptos = try await webService.downloadCurrenciesContinuation(url: url)

            cryptoList = cryptos.map(CryptoViewModel.init)

        } catch {
            print(error)
        }
    }

//    func downloadCryptosAsync(url: URL) async {
//        do {
//            let cryptos = try await webService.downloadCurrenciesAsync(url: url)
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
//        } catch {
//            print(error)
//        }
//    }
/*
    func downloadCryptos(url: URL) {
        webService.downloadCurrencies(url: url) { result in
            switch result {
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    */

}

struct CryptoViewModel {

    let crypto: CryptoCurrency

    var id: UUID? {
        crypto.id
    }

    var currency: String {
        crypto.currency
    }

    var price: String {
        crypto.price
    }

}
