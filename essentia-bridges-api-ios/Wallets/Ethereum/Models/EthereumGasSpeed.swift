//
//  EthereumGasSpeed.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 11/8/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumGasSpeed: Codable {
    public var result: EthereumGasSpeedResult
}

public struct EthereumGasSpeedResult: Codable {
    public var fast: Double
    public var average: Double
    public var safeLow: Double
    
    enum CodingKeys: String, CodingKey {
        case fast = "Fast"
        case average = "Average"
        case safeLow = "SafeLow"
    }
}
