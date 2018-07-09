//
//  EthereumEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    enum GetBalans {
        static var path: NSString = "ethereum/wallets/%@/balance"
    }
}

enum EthereumEndpoint {
    case getBalance(Address)
    case sendTransaction(from: Address, to: Address, balance: Balance)
    
}
