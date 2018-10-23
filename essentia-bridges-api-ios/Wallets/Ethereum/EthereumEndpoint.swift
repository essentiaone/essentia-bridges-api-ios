//
//  EthereumEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

fileprivate enum Constants {
    enum Path {
        static var getBalans: NSString = "/ethereum/wallets/%@/balance"
        static var getTransactionCount: NSString = "/ethereum/wallets/%@/transactions/count"
        static var getTransactionByHash: NSString = "/ethereum/transactions/%@"
        static var getReceiptOfTransaction: NSString = "/ethereum/transactions/receipts/%@"
        static var txHistory: NSString =
        "/api?module=account&action=txlist&address=%@&startblock=0&endblock=99999999&sort=asc&apikey=%@"
        static var sendTransaction = "/ethereum/wallets/transactions"
        static var callSmartContracet = "/ethereum/smart-contracts"
        static var getGasPrice = "/ethereum/gas/price"
        static var getGasEstimate = "/ethereum/gas/estimate"
        static var getBlockNumber = "/ethereum/block-number"
    }
    
    enum Headers {
        static var address = "address"
        static var data = "data"
    }
    
    enum Body {
        static var data = "data"
        static var toAddress = "to"
    }
}
//http://api.etherscan.io/api?module=account&action=txl
// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/ethereum.rst
enum EthereumEndpoint: RequestProtocol {
    case getBalance(Address)
    case sendTransaction(withData: TransactionData)
    case getTransactionCount(Address)
    case callSmartContract(Address, withData: TransactionData)
    case getGasPrice
    case getGasEstimate(Address, withData: TransactionData)
    case getBlockNumber
    case getTransactionByHash(TransactionHash)
    case getReceiptOfTransaction(TransactionHash)
    case getHistory(Address, ApiKey)

    var path: String {
        switch self {
        case .getBalance(let address):
            return NSString(format: Constants.Path.getBalans, address).description
        case .getTransactionCount(let address):
            return NSString(format: Constants.Path.getTransactionCount, address).description
        case .getTransactionByHash(let transaction):
            return NSString(format: Constants.Path.getTransactionByHash, transaction).description
        case .getReceiptOfTransaction(let transaction):
            return NSString(format: Constants.Path.getReceiptOfTransaction, transaction).description
        case .sendTransaction:
            return Constants.Path.sendTransaction
        case .callSmartContract:
            return Constants.Path.callSmartContracet
        case .getGasPrice:
            return Constants.Path.getGasPrice
        case .getGasEstimate:
            return Constants.Path.getGasEstimate
        case .getBlockNumber:
            return Constants.Path.getBlockNumber
        case .getHistory(let address, let apikey):
            return NSString(format:  Constants.Path.txHistory, address, apikey).description
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .callSmartContract(let toAddress, let withData):
            return [Constants.Body.toAddress: toAddress,
                    Constants.Body.data: withData]
        case .sendTransaction(let withData):
            return [Constants.Body.data: withData]
        default:
            return nil
        }
    }
    
    var extraHeaders: [String : String]? {
        switch self {
        case .getGasEstimate(let address, let withData):
            return [Constants.Headers.address: address,
                    Constants.Headers.data: withData]
        default:
            return nil
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .callSmartContract: fallthrough
        case .sendTransaction:
            return .post
        default:
            return .get
        }
    }
    
    var contentType: RequestContentType {
        return .json
    }
    
}
