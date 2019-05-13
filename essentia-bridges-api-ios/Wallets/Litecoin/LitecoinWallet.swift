//
//  LitecoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import EssentiaNetworkCore

public class LitecoinWallet: BaseWallet, UtxoWalletUnterface {
    public override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
<<<<<<< Updated upstream:essentia-bridges-api-ios/Wallets/Litecoin/LitecoinWallet.swift
    public func getBalance(for address: Address, result: @escaping (NetworkResult<LitecoinBalance>) -> Void) {
        networking.request(LitecoinEndpoint.getBalance(address), result: result)
=======
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(LitecoinEndpoint.getBalance(address),
                           result: { (responce: NetworkResult<UtxoBalanceResponce>) in
            switch responce {
            case .success(let object):
                result(.success(object.balance.value))
            case .failure(let error):
                result(.failure(error))
            }
        })
>>>>>>> Stashed changes:essentia-bridges-api-ios/Wallets/Utxo/Litecoin/LitecoinWallet.swift
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx) {
        networking.request(LitecoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address, result: @escaping HistoryUtxoTx) {
        networking.request(LitecoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId, result: @escaping UtxoTx) {
        networking.request(LitecoinEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void) {
        networking.request(LitecoinEndpoint.getUTxo(address), result: result)
    }
}
