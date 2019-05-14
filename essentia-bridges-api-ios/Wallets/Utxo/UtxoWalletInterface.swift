//
//  UtxoWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/10/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public protocol UtxoWalletUnterface: WalletInterface {
    func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx)
    func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void)
    func getTransactionsHistory(for address: Address, result: @escaping HistoryUtxoTx)
    func getTransactionById(for txId: TransactionId, result: @escaping UtxoTx) 
}

extension UtxoWalletUnterface {
    public var title: String {
        return "Utxo Wallet"
    }
}

public typealias SendUtxoTx = (NetworkResult<UtxoSendTXResponse>) -> Void
public typealias HistoryUtxoTx = (NetworkResult<UtxoTransactionsHistory>) -> Void
public typealias UtxoTx = (NetworkResult<UtxoTransactionValue>) -> Void
