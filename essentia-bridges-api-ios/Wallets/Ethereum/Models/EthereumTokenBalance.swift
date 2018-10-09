//
//  EthereumTokenBalance.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10/9/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTokenBalance: Decodable {
    public let balance: String
    
    enum CodingKeys: String, CodingKey {
        case balance = "result"
    }
}
