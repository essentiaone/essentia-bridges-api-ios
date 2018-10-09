//
//  EthereumSmartContract.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10/9/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumSmartContract {
    public var to: Address
    public var data: TransactionData
    
    public init(to: Address, data: TransactionData) {
        self.to = to
        self.data = data
    }
}
