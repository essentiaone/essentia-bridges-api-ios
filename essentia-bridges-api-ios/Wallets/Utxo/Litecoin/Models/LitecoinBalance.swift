//
//  LitecoinBalance.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct LitecoinBalanceValue: Decodable {
    public let value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "balance"
    }
}

public struct LitecoinBalance: Decodable {
    public let balance: LitecoinBalanceValue
    
    enum CodingKeys: String, CodingKey {
        case balance = "result"
    }
}
