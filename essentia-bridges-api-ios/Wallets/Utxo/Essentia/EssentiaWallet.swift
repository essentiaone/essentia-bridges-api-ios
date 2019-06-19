//
//  EssentiaWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 6/11/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

public class EssentiaWallet: BaseWallet, UtxoWalletUnterface {
    public override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(EssentiaEndpoint.getBalance(address), result: { (responce: NetworkResult<UtxoBalanceResponce>) in
            switch responce {
            case .success(let object):
                result(.success(object.balance.value))
            case .failure(let error):
                result(.failure(error))
            }
        })
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx) {
        networking.request(EssentiaEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryUtxoTx) {
        networking.request(EssentiaEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping UtxoTx) {
        networking.request(EssentiaEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void) {
        networking.request(EssentiaEndpoint.getUTxo(address), result: result)
    }
}
