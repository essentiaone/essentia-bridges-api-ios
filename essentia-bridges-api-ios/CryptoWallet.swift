//
//  CryptoWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import HDWalletKit

fileprivate var etherScanApiUrl = "http://api.etherscan.io"

public class CryptoWallet {
    public init(bridgeApiUrl: String, etherScanApiKey: String) {
        bitcoin = BitcoinWallet(bridgeApiUrl)
        ethereum = EthereumWallet(bridgeApiUrl,
                                  etherScan: EtherScanInfo(url: etherScanApiUrl,
                                                           apiKey: etherScanApiKey))
        litecoin = LitecoinWallet(bridgeApiUrl)
        bitcoinCash = BitcoinCashWallet(bridgeApiUrl)
        dash = DashWallet(bridgeApiUrl)
    }

    public let ethereum: EthereumWalletInterface
    
    public let bitcoin: UtxoWalletUnterface
    public let litecoin: UtxoWalletUnterface
    public let bitcoinCash: UtxoWalletUnterface
    public let dash: UtxoWalletUnterface
    
    public func utxoWalletForCoin(coin: Coin) -> UtxoWalletUnterface {
        switch coin {
        case .bitcoin:
            return bitcoin
        case .bitcoinCash:
            return bitcoinCash
        case .litecoin:
            return litecoin
        case .dash:
            return dash
        default: fatalError("There no such Utxo wallet!")
        }
    }
}
