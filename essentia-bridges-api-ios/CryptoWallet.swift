//
//  CryptoWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public class CryptoWallet {
    init(serverUrl: String) {
        bitcoin = BitcoinWallet(serverUrl)
        ethereum = EthereumWallet(serverUrl)
        litecoin = LitecoinWallet(serverUrl)
        bitcoinCash = BitcoinCashWallet(serverUrl)
    }

    public let bitcoin: BitcoinWalletInterface
    public let ethereum: EthereumWalletInterface
    public let litecoin: LitecoinWalletInterface
    public let bitcoinCash: BitcoinCashWalletInterface
}
