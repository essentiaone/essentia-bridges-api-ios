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
    
    func getBalance(for address: Address, result: @escaping (NetworkResult<BitcoinCashBalance>) -> Void) {
        networking.makeAsyncRequest(BitcoinCashEndpoint.getBalance(address), result: result)
    }
    
    func getTransactionsHistory(for addr: Address,
                                result: @escaping (NetworkResult<BitcoinCashTransactionsHistory>) -> Void) {
        networking.makeAsyncRequest(BitcoinCashEndpoint.getTransactionsHistory(addr), result: result)
    }
    
    func getTransactionById(for txId: String,
                            result: @escaping (NetworkResult<BitcoinCashTransactionByIdValue>) -> Void) {
        networking.makeAsyncRequest(BitcoinCashEndpoint.getTransactionById(txId), result: result)
    }
    
    func sendRawTransaction(with data: TransactionData,
                            result: @escaping (NetworkResult<BitcoinCashSendTXResponse>) -> Void) {
        networking.makeAsyncRequest(BitcoinCashEndpoint.sendRawTransaction(withData: data), result: result)
    }
    
}
