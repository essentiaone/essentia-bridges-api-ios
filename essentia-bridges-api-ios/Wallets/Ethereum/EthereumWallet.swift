//
//  EthereumWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

class EthereumWallet: BaseWallet, EthereumWalletInterface {
    let etherScan: EtherScanInfo
    
    init(_ bridgeUrl: String, etherScan: EtherScanInfo) {
        self.etherScan = etherScan
        super.init(bridgeUrl)
    }
    
    func getBalance(for address: Address, result: @escaping (Result<EthereumBalance>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getBalance(address), result: result)
    }
    
    func sendTransaction(with data: TransactionData, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(EthereumEndpoint.sendTransaction(withData: data), result: result)
    }
    
    func getTransactionCount(for address: Address, result: @escaping (Result<EthereumTransactionCount>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getTransactionCount(address), result: result)
    }
    
    func callSmartContract(to address: Address, data: TransactionData, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(EthereumEndpoint.callSmartContract(address, withData: data), result: result)
    }
    
    func getGasPrice(result: @escaping (Result<EthereumNumberValue>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getGasPrice, result: result)
    }
    
    func getGasEstimate(
        to address: Address,
        data: TransactionData,
        result: @escaping (Result<EthereumNumberValue>) -> Void
    ) {
        networking.makeRequest(EthereumEndpoint.getGasEstimate(address, withData: data), result: result)
    }
    
    func getTransactionByHash(for hash: TransactionHash, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getTransactionByHash(hash), result: result)
    }
    
    func getReceiptOfTransaction(for hash: TransactionHash, result: @escaping (Result<String>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getReceiptOfTransaction(hash), result: result)
    }
    
    func getBlockNumber(result: @escaping (Result<EthereumNumberValue>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getBlockNumber, result: result)
    }
}
