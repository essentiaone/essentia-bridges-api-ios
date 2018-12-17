//
//  EthereumWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

fileprivate enum Constants {
    static var title: String = "Ethereum"
}

public protocol EthereumWalletInterface: WalletInterface {
    func getBalance(for address: Address, result: @escaping (NetworkResult<EthereumBalance>) -> Void)
    func sendTransaction(with data: TransactionData, result: @escaping (NetworkResult<EthereumTxId>) -> Void)
    func getTransactionCount(for address: Address, result: @escaping (NetworkResult<EthereumTransactionCount>) -> Void)
    func callSmartContract<T: Decodable>(info: EthereumSmartContract, result: @escaping (NetworkResult<T>) -> Void)
    func getGasPrice(result: @escaping (NetworkResult<EthereumNumberValue>) -> Void)
    func getGasEstimate(from: Address,
                        to: Address,
                        data: String,
                        result: @escaping (NetworkResult<EthereumNumberValue>) -> Void)
    func getBlockNumber(result: @escaping (NetworkResult<EthereumNumberValue>) -> Void)
    func getGasSpeed(result: @escaping (NetworkResult<EthereumGasSpeed>) -> Void)
    func getTransactionByHash(for hash: TransactionHash, result: @escaping (NetworkResult<String>) -> Void)
    func getReceiptOfTransaction(for hash: TransactionHash, result: @escaping (NetworkResult<String>) -> Void)
    func getTokenBalance(info: EthereumSmartContract, result: @escaping (NetworkResult<EthereumTokenBalance>) -> Void)
    func getTokenTxHistory(for address: Address,
                           smartContract: Address,
                           result: @escaping (NetworkResult<EthereumTokenTransactionByAddress>) -> Void)
    func getTxHistory(for address: Address, result: @escaping (NetworkResult<EthereumTransactionsByAddress>) -> Void)
}

extension EthereumWalletInterface {
    public var title: String {
        return Constants.title
    }
}
