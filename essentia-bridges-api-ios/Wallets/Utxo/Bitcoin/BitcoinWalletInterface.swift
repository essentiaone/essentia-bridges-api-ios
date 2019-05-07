//
//  BitcoinWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

private enum Constants {
    static var title: String = "Bitcoin"
}

public protocol BitcoinWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (NetworkResult<UtxoBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping (NetworkResult<BitcoinSendTXResponse>) -> Void)
    func getTransactionsHistory(for address: Address,
                                result: @escaping (NetworkResult<BitcoinTransactionsHistory>) -> Void)
    func getUTxo(for address: Address, result: @escaping (NetworkResult<[BitcoinUTXO]>) -> Void)
    func getTransactionById(for txId: TransactionId, result: @escaping (NetworkResult<BitcoinTransactionValue>) -> Void)
}

extension BitcoinWalletInterface {
    public var title: String {
        return Constants.title
    }
}
