//
//  EthereumTokenTransactionDetail.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 12/13/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTokenTransactionDetail: Codable {
    public var blockNumber: String
    public var timeStamp: String
    public var hash: String
    public var nonce: String
    public var blockHash: String
    public var from: String
    public var to: String
    public var value: String
    public var tokenName: String
    public var tokenSymbol: String
    public var tokenDecimal: String
    public var transactionIndex: String
    public var gas: String
    public var gasPrice: String
    public var input: String
    public var contractAddress: String
    public var cumulativeGasUsed: String
    public var gasUsed: String
    public var confirmations: String
}
