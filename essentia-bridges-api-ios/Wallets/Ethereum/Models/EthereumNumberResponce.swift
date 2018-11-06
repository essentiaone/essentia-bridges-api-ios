//
//  EthereumGasPrice.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 11.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumNumberValue: Decodable {
    public let value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "result"
    }
}
