//
//  EthereumTokenTransactionByAddress.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 12/13/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTokenTransactionByAddress: Codable {
    public var status: String
    public var message: String
    public var result: [EthereumTokenTransactionDetail]
}
