//
//  BitcoinTransactionsHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

public struct BitcoinTransactionsHistory: Decodable {
    public let totalItems: Int
    public let from: Int
    public let to: Int
    public let items: [BitcoinTransactionValue]
    
}
