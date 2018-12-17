//
//  LitecoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import EssentiaNetworkCore

class LitecoinWallet: BaseWallet, LitecoinWalletInterface {
    
    override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    func getBalance(for address: Address, result: @escaping (NetworkResult<LitecoinBalance>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getBalance(address), result: result)
    }
    
    func sendTransaction(with data: TransactionData,
                         result: @escaping (NetworkResult<LitecoinSendTXResponse>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    func getTransactionsHistory(for address: Address,
                                result: @escaping (NetworkResult<LitecoinTransactionsHistory>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    func getTransactionById(for txId: TransactionId,
                            result: @escaping (NetworkResult<LitecoinTransactionValue>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getTransactionById(txId), result: result)
    }
    
    func getUTxo(for address: Address, result: @escaping (NetworkResult<[LitecoinUTXO]>) -> Void) {
        networking.makeAsyncRequest(LitecoinEndpoint.getUTxo(address), result: result)
    }
}
