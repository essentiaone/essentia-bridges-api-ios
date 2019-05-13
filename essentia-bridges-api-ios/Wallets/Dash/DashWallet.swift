//
//  DashWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

public class DashWallet: BaseWallet, UtxoWalletUnterface {
    public override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
<<<<<<< Updated upstream:essentia-bridges-api-ios/Wallets/Dash/DashWallet.swift
    public func getBalance(for address: Address, result: @escaping (NetworkResult<DashBalance>) -> Void) {
        networking.request(DashEndpoint.getBalance(address), result: result)
=======
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(DashEndpoint.getBalance(address), result: { (responce: NetworkResult<UtxoBalanceResponce>) in
            switch responce {
            case .success(let object):
                result(.success(object.balance.value))
            case .failure(let error):
                result(.failure(error))
            }
        })
>>>>>>> Stashed changes:essentia-bridges-api-ios/Wallets/Utxo/Dash/DashWallet.swift
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx) {
        networking.request(DashEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryUtxoTx) {
        networking.request(DashEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping UtxoTx) {
        networking.request(DashEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void) {
        networking.request(DashEndpoint.getUTxo(address), result: result)
    }
}
