//
//  DashWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

private enum Constants {
    static var title: String = "Dash"
}

public typealias SendDashTx = (NetworkResult<DashSendTXResponse>) -> Void
public typealias HistoryDashTx = (NetworkResult<DashTransactionsHistory>) -> Void
public typealias DashTx = (NetworkResult<DashTransactionValue>) -> Void

public protocol DashWalletInterface: WalletInterface {
    func getBalance(for address: String, result: @escaping (NetworkResult<DashBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping SendDashTx)
    func getTransactionsHistory(for address: Address, result: @escaping HistoryDashTx)
    func getUTxo(for address: Address, result: @escaping (NetworkResult<[DashUTXO]>) -> Void)
    func getTransactionById(for txId: TransactionId, result: @escaping DashTx)
}

extension DashWalletInterface {
    public var title: String {
        return Constants.title
    }
}
