//
//  DashBalance.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct dashBalanceValue: Decodable {
    public let value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "balance"
    }
}

public struct DashBalance: Decodable {
    public let balance: dashBalanceValue
    
    enum CodingKeys: String, CodingKey {
        case balance = "result"
    }
}
