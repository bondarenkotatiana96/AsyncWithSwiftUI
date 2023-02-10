//
//  CryptoCurrency.swift
//  AsyncImage
//
//  Created by Tatiana Bondarenko on 2/9/23.
//

import Foundation

struct CryptoCurrency: Decodable, Identifiable {
    let id = UUID()
    let currency: String
    let price: String

    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }

}
