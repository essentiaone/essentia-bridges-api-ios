//
//  CryptoWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public class CryptoWallet {
    public static let bitcoin: BitcoinWalletInterface = BitcoinWallet()
    public static let ethereum: EthereumWalletInterface = EthereumWallet()
    public static let litecoin: LitecoinWalletInterface = LitecoinWallet()
    public static let bitcoinCash: BitcoinCashWalletInterface = BitcoinCashWallet()
}
