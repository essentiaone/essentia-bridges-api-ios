//
//  DashWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

public class DashWallet: BaseWallet, DashWalletInterface {
    
    public override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<DashBalance>) -> Void) {
        networking.makeAsyncRequest(DashEndpoint.getBalance(address), result: result)
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendDashTx) {
        networking.makeAsyncRequest(DashEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryDashTx) {
        networking.makeAsyncRequest(DashEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping DashTx) {
        networking.makeAsyncRequest(DashEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUTxo(for address: Address, result: @escaping (NetworkResult<[DashUTXO]>) -> Void) {
        networking.makeAsyncRequest(DashEndpoint.getUTxo(address), result: result)
    }
}
