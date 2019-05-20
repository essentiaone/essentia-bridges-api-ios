//
//  BitcoinCashWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public class BitcoinCashWallet: BaseWallet, UtxoWalletUnterface {
    private let cashUtxoNetwork: NetworkManager
    override public init(_ bridgeUrl: String) {
        self.cashUtxoNetwork = NetworkManager("https://blockdozer.com/")
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<UtxoBalance>) -> Void) {
        networking.request(BitcoinCashEndpoint.getBalance(address),
                           result: {( responce: NetworkResult<BitcoinCashBalance>) in
                            result(responce.adapt(adapting: { (responce) -> UtxoBalance in
                                return responce.result
                            }))
        })
    }
    
    public func getTransactionsHistory(for addr: Address, result: @escaping HistoryUtxoTx) {
        networking.request(BitcoinCashEndpoint.getTransactionsHistory(addr),
                           result: {( responce: NetworkResult<BitcoinCashTransactionsHistory>) in
                            result(responce.adapt(adapting: { (responce) -> UtxoTransactionsHistory in
                                return responce.result
                            }))
        })
    }
    
    public func getTransactionById(for txId: String, result: @escaping UtxoTx) {
        networking.request(BitcoinCashEndpoint.getTransactionById(txId),
                           result: {( responce: NetworkResult<BitcoinCashTransactionByIdValue>) in
                            result(responce.adapt(adapting: { (responce) -> UtxoTransactionValue in
                                return responce.result
                            }))
        })
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping SendUtxoTx) {
        networking.request(BitcoinCashEndpoint.sendRawTransaction(withData: data), result: result)
    }
    
    public func getUtxo(for address: Address, result: @escaping (NetworkResult<[UtxoResponce]>) -> Void) {
        cashUtxoNetwork.request(BitcoinCashUtxoEndpoint(address), result: result)
    }
}
