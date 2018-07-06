//
//  EthereumWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var title: String = "Ethereum"
}

public protocol EthereumWalletInterface: WalletInterface {
    func getBalance(for address: String) -> Double
}

extension EthereumWalletInterface {
    public var title: String {
        return Constants.title
    }
}
