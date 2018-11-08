//
//  EthereumWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

class EthereumWallet: BaseWallet, EthereumWalletInterface {
    let etherScan: EtherScanInfo
    let ethereScanNetwork: NetworkManagerInterface
    
    init(_ bridgeUrl: String, etherScan: EtherScanInfo) {
        self.etherScan = etherScan
        self.ethereScanNetwork = NetworkManager(etherScan.url)
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
    
    func callSmartContract<T: Decodable>(info: EthereumSmartContract, result: @escaping (Result<T>) -> Void) {
        networking.makeRequest(EthereumEndpoint.callSmartContract(info.to, withData: info.data), result: result)
    }
    
    func getGasPrice(result: @escaping (Result<EthereumNumberValue>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getGasPrice, result: result)
    }
    
    func getGasEstimate(from: Address,
                        to: Address,
                        data: String,
                        result: @escaping (Result<EthereumNumberValue>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getGasEstimate(from: from, to: to, data: data), result: result)
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
    
    func getTxHistory(for address: Address, result: @escaping (Result<EthereumTransactionsByAddress>) -> Void) {
        ethereScanNetwork.makeRequest(EthereumEndpoint.getHistory(address, etherScan.apiKey), result: result)
    }
    
    func getGasSpeed(result: @escaping (Result<EthereumGasSpeed>) -> Void) {
        networking.makeRequest(EthereumEndpoint.getGasSpeed, result: result)
    }
    
    // MARK: Smart Contracts
    func getTokenBalance(info: EthereumSmartContract, result: @escaping (Result<EthereumTokenBalance>) -> Void) {
        networking.makeRequest(EthereumEndpoint.callSmartContract(info.to, withData: info.data), result: result)
    }
}
