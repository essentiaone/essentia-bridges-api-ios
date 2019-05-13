//
//  Dashtransactionshistory.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct DashTransactionsHistory: Decodable {
    public let totalItems: Int
    public let fromNumber: Int
    public let toNumber: Int
    public let items: [DashTransactionValue]
    
    enum CodingKeys: String, CodingKey {
        case totalItems = "totalItems"
        case fromNumber = "from"
        case toNumber = "to"
        case items = "items"
    }
}
