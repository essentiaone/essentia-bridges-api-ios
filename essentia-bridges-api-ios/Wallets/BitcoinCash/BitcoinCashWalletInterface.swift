//
//  BitcoinCashWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

private enum Constants {
    static var title: String = "BitcoinCash"
}

public protocol BitcoinCashWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (Result<BitcoinCashBalance>) -> Void)
    func getTransactionsHistory(for addr: Address, result: @escaping (Result<BitcoinCashTransactionsHistory>) -> Void)
    func getTransactionById(for txId: String, result: @escaping (Result<BitcoinCashTransactionByIdValue>) -> Void)
    func sendRawTransaction(with data: TransactionData, result: @escaping (Result<BitcoinCashSendTXResponse>) -> Void)
}

extension BitcoinCashWalletInterface {
    var title: String {
        return Constants.title
    }
}
