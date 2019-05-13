//
//  UtxoBalanceResponce.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/13/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct UtxoBalanceValue: Decodable {
    public let value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "balance"
    }
}

public struct UtxoBalanceResponce: Decodable {
    public let balance: UtxoBalanceValue
    
    enum CodingKeys: String, CodingKey {
        case balance = "result"
    }
}
