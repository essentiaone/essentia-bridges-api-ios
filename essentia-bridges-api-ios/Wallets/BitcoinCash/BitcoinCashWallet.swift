//
//  BitcoinCashWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

class BitcoinCashWallet: BaseWallet, BitcoinCashWalletInterface {
    
    override init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    func getBalance(for address: Address, result: @escaping (Result<BitcoinCashBalance>) -> Void) {
        networking.makeRequest(BitcoinCashEndpoint.getBalance(address), result: result)
    }
    
    func getTransactionsHistory(for addr: Address, result: @escaping (Result<BitcoinCashTransactionsHistory>) -> Void) {
        networking.makeRequest(BitcoinCashEndpoint.getTransactionsHistory(addr), result: result)
    }
    
    func getTransactionById(for txId: String, result: @escaping (Result<BitcoinCashTransactionByIdValue>) -> Void) {
        networking.makeRequest(BitcoinCashEndpoint.getTransactionById(txId), result: result)
    }
    
    func sendRawTransaction(with data: TransactionData, result: @escaping (Result<BitcoinCashSendTXResponse>) -> Void) {
        networking.makeRequest(BitcoinCashEndpoint.sendRawTransaction(withData: data), result: result)
    }
    
}
