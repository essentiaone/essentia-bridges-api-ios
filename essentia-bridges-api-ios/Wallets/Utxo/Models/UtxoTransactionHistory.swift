//
//  UtxoTransactionHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/13/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct UtxoTransactionsHistory: Decodable {
    public let totalItems: Int
    public let fromNumber: Int
    public let toNumber: Int
    public let items: [UtxoTransactionValue]
    
    enum CodingKeys: String, CodingKey {
        case totalItems = "totalItems"
        case fromNumber = "from"
        case toNumber = "to"
        case items = "items"
    }
}
