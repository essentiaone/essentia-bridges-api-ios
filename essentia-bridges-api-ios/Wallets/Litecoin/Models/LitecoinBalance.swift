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
    
    enum CodingKeys: CodingKey, String {
        case value = "balance"
    }
}

public struct LitecoinBalance: Decodable {
    public let balance: LitecoinBalanceValue
    
    enum CodingKeys: CodingKey, String {
        case balance = "result"
    }
}
