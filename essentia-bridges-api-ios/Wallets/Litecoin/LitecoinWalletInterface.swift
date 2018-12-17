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

public protocol LitecoinWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (NetworkResult<LitecoinBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping (NetworkResult<LitecoinSendTXResponse>) -> Void)
    func getTransactionsHistory(for address: Address,
                                result: @escaping (NetworkResult<LitecoinTransactionsHistory>) -> Void)
    func getUTxo(for address: Address, result: @escaping (NetworkResult<[LitecoinUTXO]>) -> Void)
    func getTransactionById(for txId: TransactionId,
                            result: @escaping (NetworkResult<LitecoinTransactionValue>) -> Void)
}

extension LitecoinWalletInterface {
    var title: String {
        return Constants.title
    }
}
