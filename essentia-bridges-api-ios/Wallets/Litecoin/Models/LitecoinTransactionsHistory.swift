//
//  LitecoinTransactionsHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 24.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct LitecoinTransactionsHistory: Decodable {
    public let totalItems: Int
    public let fromNumber: Int
    public let toNumber: Int
    public let items: [LitecoinTransactionValue]
    
    enum CodingKeys: String, CodingKey {
        case totalItems = "totalItems"
        case fromNumber = "from"
        case toNumber = "to"
        case items = "items"
    }

}

