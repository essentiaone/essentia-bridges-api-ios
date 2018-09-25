//
//  BitcoinWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

fileprivate enum Constants {
    static var title: String = "Bitcoin"
}

public protocol BitcoinWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (Result<BitcoinBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping (Result<String>) -> Void)
    func getTransactionsHistory(for address: Address, result: @escaping (Result<BitcoinTransactionsHistory>) -> Void)
    func getUTxo(for address: Address, result: @escaping (Result<[BitcoinUTXO]>) -> Void)
    func getTransactionById(for id: TransactionId, result: @escaping (Result<BitcoinTransactionValue>) -> Void)
}

extension BitcoinWalletInterface {
    var title: String {
        return Constants.title
    }
}
