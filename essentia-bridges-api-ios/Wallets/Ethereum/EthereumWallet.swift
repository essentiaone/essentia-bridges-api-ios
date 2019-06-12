//
//  EthereumWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public class EthereumWallet: BaseWallet, EthereumWalletInterface {
    public let etherScan: EtherScanInfo
    public let ethereScanNetwork: NetworkManagerInterface
    
    public init(_ bridgeUrl: String, etherScan: EtherScanInfo) {
        self.etherScan = etherScan
        self.ethereScanNetwork = NetworkManager(etherScan.url)
        super.init(bridgeUrl)
    }
    
    public func getBalance(for address: Address, result: @escaping (NetworkResult<EthereumBalance>) -> Void) {
        networking.request(EthereumEndpoint.getBalance(address), result: result)
    }
    
    public func sendTransaction(with data: TransactionData, result: @escaping (NetworkResult<EthereumTxId>) -> Void) {
        networking.request(EthereumEndpoint.sendTransaction(withData: data), result: result)
    }
    
    public func getTransactionCount(for address: Address,
                                    result: @escaping (NetworkResult<EthereumTransactionCount>) -> Void) {
        networking.request(EthereumEndpoint.getTransactionCount(address), result: result)
    }
    
    public func callSmartContract<T: Decodable>(info: EthereumSmartContract,
                                                result: @escaping (NetworkResult<T>) -> Void) {
        networking.request(EthereumEndpoint.callSmartContract(info.to, withData: info.data), result: result)
    }
    
    public func getGasPrice(result: @escaping (NetworkResult<EthereumNumberValue>) -> Void) {
        networking.request(EthereumEndpoint.getGasPrice, result: result)
    }
    
    public func getGasEstimate(from: Address,
                               to: Address,
                               data: String,
                               result: @escaping (NetworkResult<EthereumNumberValue>) -> Void) {
        networking.request(EthereumEndpoint.getGasEstimate(from: from, to: to, data: data), result: result)
    }
    
    public func getTransactionByHash(for hash: TransactionHash, result: @escaping (NetworkResult<String>) -> Void) {
        networking.request(EthereumEndpoint.getTransactionByHash(hash), result: result)
    }
    
    public func getReceiptOfTransaction(for hash: TransactionHash, result: @escaping (NetworkResult<String>) -> Void) {
        networking.request(EthereumEndpoint.getReceiptOfTransaction(hash), result: result)
    }
    
    public func getBlockNumber(result: @escaping (NetworkResult<EthereumNumberValue>) -> Void) {
        networking.request(EthereumEndpoint.getBlockNumber, result: result)
    }
    
    public func getTxHistory(for address: Address,
                             result: @escaping (NetworkResult<EthereumTransactionsByAddress>) -> Void) {
        ethereScanNetwork.request(EthereumEndpoint.getHistory(address, etherScan.apiKey), result: result)
    }
    
    public func getTokenTxHistory(for address: Address,
                                  smartContract: Address,
                                  result: @escaping (NetworkResult<EthereumTokenTransactionByAddress>) -> Void) {
        ethereScanNetwork.request(EthereumEndpoint.getTokenHistory(address,
                                                                   smartContract: smartContract,
                                                                   etherScan.apiKey),
                                  result: result)
    }
    
    public func getWalletTokenHistory(for address: Address, result: @escaping (NetworkResult<EthereumTokenTransactionByAddress>) -> Void) {
        ethereScanNetwork.request(EthereumEndpoint.walletTokenHistory(address, etherScan.apiKey, result: result))
    }
    
    public func getGasSpeed(result: @escaping (NetworkResult<EthereumGasSpeed>) -> Void) {
        networking.request(EthereumEndpoint.getGasSpeed, result: result)
    }
    
    // MARK: Smart Contracts
    public func getTokenBalance(info: EthereumSmartContract,
                                result: @escaping (NetworkResult<EthereumTokenBalance>) -> Void) {
        networking.request(EthereumEndpoint.callSmartContract(info.to, withData: info.data), result: result)
    }
}
