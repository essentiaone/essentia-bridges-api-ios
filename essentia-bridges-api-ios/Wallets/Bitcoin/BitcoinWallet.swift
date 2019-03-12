//
//  BitcoinWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public class BitcoinWallet: BaseWallet, BitcoinWalletInterface {
    
    override public  init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<BitcoinBalance>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getBalance(address), result: result)
    }
    
    public func sendTransaction(with data: TransactionData,
                                result: @escaping (NetworkResult<BitcoinSendTXResponse>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionsHistory(for address: Address,
                                       result: @escaping (NetworkResult<BitcoinTransactionsHistory>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getTransactionsHistory(address), result: result)
    }
    
    public func getTransactionById(for txId: TransactionId,
                                   result: @escaping (NetworkResult<BitcoinTransactionValue>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getTransactionById(txId), result: result)
    }
    
    public func getUTxo(for address: Address, result: @escaping (NetworkResult<[BitcoinUTXO]>) -> Void) {
        networking.makeAsyncRequest(BitcoinEndpoint.getUTxo(address), result: result)
    }
}
