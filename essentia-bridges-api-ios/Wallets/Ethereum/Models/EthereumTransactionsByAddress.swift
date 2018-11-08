//
//  EthereumTransactionsByAddress.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10/23/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTransactionsByAddress: Codable {
    public var status: String
    public var message: String
    public var result: [EthereumTransactionDetail]
}
