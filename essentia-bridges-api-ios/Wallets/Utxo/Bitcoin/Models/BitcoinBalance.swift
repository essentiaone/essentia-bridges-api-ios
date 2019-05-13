//
//  BitcoinBalance.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

public struct BitcoinBalanceValue: Decodable {
    public let value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "balance"
    }
}
public struct BitcoinBalance: Decodable {
    public let balance: BitcoinBalanceValue
    
    enum CodingKeys: String, CodingKey {
        case balance = "result"
    }
}
