//
//  BitcoinTransactionsHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct BitcoinTransactionsHistory: Decodable {
    public let totalItems: Int
    public let from: Int
    public let to: Int
    public let items: [BitcoinTransactionValue]
    
    
    enum CodingKeys: CodingKey, String {
        case totalItems = "totalItems"
        case from = "from"
        case to = "to"
        case items = "items"
    }
}
