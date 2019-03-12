//
//  LitecoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import EssentiaNetworkCore

public class LitecoinWallet: BaseWallet, LitecoinWalletInterface {
    
    public override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<LitecoinBalance>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getBalance(address), result: result)
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendLitecoinTx) {
        networking.makeAsyncRequest(LitecoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryLitecoinTx) {
        networking.makeAsyncRequest(LitecoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping LitecoinTx) {
        networking.makeAsyncRequest(LitecoinEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUTxo(for address: Address, result: @escaping (NetworkResult<[LitecoinUTXO]>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getUTxo(address), result: result)
    }
}
