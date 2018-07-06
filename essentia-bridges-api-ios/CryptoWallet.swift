//
//  CryptoWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public class CryptoWallet {
    public static let bitcoin: IBitcoinWalletProtocol = BitcoinWallet()
    public static let ethereum: IEthereumWalletProtocol = EthereumWallet()
    public static let litecoin: ILitecoinWalletProtocol = LitecoinWallet()
    public static let bitcoinCash: IBitcoinCashWalletProtocol = BitcoinCashWallet()
    
}
