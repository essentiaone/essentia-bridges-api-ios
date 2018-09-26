//
//  BitcoinTransactionsHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

public struct BitcoinTransactionsHistory: Decodable {
    public let totalItems: Int
    public let fromNumber: Int
    public let toNumber: Int
    public let items: [BitcoinTransactionValue]
    
    enum CodingKeys: String, CodingKey {
        case totalItems = "totalItems"
        case fromNumber = "from"
        case toNumber = "to"
        case items = "items"
    }
}
