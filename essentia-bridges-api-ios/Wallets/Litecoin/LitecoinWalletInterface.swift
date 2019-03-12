//
//  LitecoinWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import EssentiaNetworkCore

private enum Constants {
    static var title: String = "Litecoin"
}

public typealias SendLitecoinTx = (NetworkResult<LitecoinSendTXResponse>) -> Void
public typealias HistoryLitecoinTx = (NetworkResult<LitecoinTransactionsHistory>) -> Void
public typealias LitecoinTx = (NetworkResult<LitecoinTransactionValue>) -> Void

public protocol LitecoinWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (NetworkResult<LitecoinBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping SendLitecoinTx)
    func getTransactionsHistory(for address: Address, result: @escaping HistoryLitecoinTx)
    func getUTxo(for address: Address, result: @escaping (NetworkResult<[LitecoinUTXO]>) -> Void)
    func getTransactionById(for txId: TransactionId, result: @escaping LitecoinTx)
}

extension LitecoinWalletInterface {
    public var title: String {
        return Constants.title
    }
}
