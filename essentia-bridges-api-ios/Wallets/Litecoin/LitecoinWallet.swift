//
//  LitecoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

class LitecoinWallet: BaseWallet, LitecoinWalletInterface {
    
    override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    func getBalance(for address: Address, result: @escaping (Result<LitecoinBalance>) -> Void) {
        networking.makeRequest(LitecoinEndpoint.getBalance(address), result: result)
    }
    
    func sendTransaction(with data: TransactionData, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(LitecoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    func getTransactionsHistory(for address: Address, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(LitecoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    func getTransactionById(for id: TransactionId, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(LitecoinEndpoint.getTransactionById(id), result: result)
    }
    
    func getUTxo(for address: Address, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(LitecoinEndpoint.getUTxo(address), result: result)
    }
}
