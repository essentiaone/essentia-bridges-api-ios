//
//  BitcoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public class BitcoinWallet: BaseWallet, UtxoWalletUnterface {
    override public  init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(BitcoinEndpoint.getBalance(address),
                           result: { (responce: NetworkResult<UtxoBalanceResponce>) in
                            result(responce.adapt(adapting: { (object) -> UtxoBalance in
                                return object.balance.value
                            }))
        })
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx) {
        networking.request(BitcoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address,
                                       result: @escaping (NetworkResult<UtxoTransactionsHistory>) -> Void) {
        networking.request(BitcoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId,
                                   result: @escaping (NetworkResult<UtxoTransactionValue>) -> Void) {
        networking.request(BitcoinEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void) {
        networking.request(BitcoinEndpoint.getUtxo(address), result: result)
    }
}
