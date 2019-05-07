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
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(LitecoinEndpoint.getBalance(address), result: { (responce: NetworkResult<LitecoinBalance>) in
            switch responce {
            case .success(let object):
                result(.success(object.balance.value))
            case .failure(let error):
                result(.failure(error))
            }
        })
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendLitecoinTx) {
        networking.request(LitecoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryLitecoinTx) {
        networking.request(LitecoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping LitecoinTx) {
        networking.request(LitecoinEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUTxo(for address: Address, result: @escaping (NetworkResult<[LitecoinUTXO]>) -> Void) {
        networking.request(LitecoinEndpoint.getUTxo(address), result: result)
    }
}
