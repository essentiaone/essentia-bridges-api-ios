//
//  EthereumTransaction.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTransaction: Codable {
    public let value: Wei
    public let toAddress: Address
    public let gasPrice: Int
    public let gasLimit: Int
    public let nonce: Int
    public let data: Data
    
    public init(wei: Wei, toAddress: Address, gasPrice: Int, gasLimit: Int, nonce: Int, data: Data = Data()) {
        self.value = wei
        self.toAddress = toAddress
        self.gasPrice = gasPrice
        self.gasLimit = gasLimit
        self.nonce = nonce
        self.data = data
    }
    
    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case value
        case toAddress = "to"
        case gasPrice
        case gasLimit
        case nonce
        case data
    }
}
