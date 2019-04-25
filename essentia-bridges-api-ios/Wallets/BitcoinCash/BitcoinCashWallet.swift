//
//  BitcoinCashWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public typealias SendBitcoinCashTx = (NetworkResult<BitcoinCashSendTXResponse>) -> Void
public typealias HistoryBitcoinCashTx = (NetworkResult<BitcoinCashTransactionsHistory>) -> Void
public typealias BitcoinCashTx = (NetworkResult<BitcoinCashTransactionByIdValue>) -> Void

public class BitcoinCashWallet: BaseWallet, BitcoinCashWalletInterface {
    
    override public init(_ bridgeUrl: String) {
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<BitcoinCashBalance>) -> Void) {
        networking.request(BitcoinCashEndpoint.getBalance(address), result: result)
    }
    
    public func getTransactionsHistory(for addr: Address, result: @escaping HistoryBitcoinCashTx) {
        networking.request(BitcoinCashEndpoint.getTransactionsHistory(addr), result: result)
    }
    
    public func getTransactionById(for txId: String, result: @escaping BitcoinCashTx) {
        networking.request(BitcoinCashEndpoint.getTransactionById(txId), result: result)
    }
    
    public func sendRawTransaction(with data: TransactionData, result: @escaping SendBitcoinCashTx) {
        networking.request(BitcoinCashEndpoint.sendRawTransaction(withData: data), result: result)
    }
    
}
