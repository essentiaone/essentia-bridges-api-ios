//
//  CryptoWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate var etherScanApiUrl = "http://api.etherscan.io"

public class CryptoWallet {
    public init(bridgeApiUrl: String, etherScanApiKey: String) {
        bitcoin = BitcoinWallet(bridgeApiUrl)
        ethereum = EthereumWallet(bridgeApiUrl,
                                  etherScan: EtherScanInfo(url: etherScanApiUrl,
                                                           apiKey: etherScanApiKey))
        litecoin = LitecoinWallet(bridgeApiUrl)
        bitcoinCash = BitcoinCashWallet(bridgeApiUrl)
    }

    public let bitcoin: BitcoinWalletInterface
    public let ethereum: EthereumWalletInterface
    public let litecoin: LitecoinWalletInterface
    public let bitcoinCash: BitcoinCashWalletInterface
}
