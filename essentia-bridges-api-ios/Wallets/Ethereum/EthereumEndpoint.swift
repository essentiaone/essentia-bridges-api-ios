//
//  EthereumEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    enum Path {
        static var getBalans: NSString = "/ethereum/wallets/%@/balance"
        static var getTransactionCount: NSString = "/ethereum/wallets/%@/transactions/count"
        static var getTransactionByHash: NSString = "/ethereum/transactions/%@"
        static var getReceiptOfTransaction: NSString = "/ethereum/transactions/receipts/%@"
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
    
}

// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/ethereum.rst
enum EthereumEndpoint: RequestProtocol {
    case getBalance(Address)
    case sendTransaction(transaction:EthereumTransaction)
    case getTransactionCount(Address)
    case callSmartContract
    case getGasPrice
    case getGasEstimate(Address, data: String)
    case getBlockNumber
    case getTransactionByHash(TransactionHash)
    case getReceiptOfTransaction(TransactionHash)
    
    var path: String {
        switch self {
        case .getBalance(let address):
            return NSString(format: Constants.Path.getBalans, address).description
        case .getTransactionCount(let address):
            return NSString(format: Constants.Path.getTransactionCount, address).description
        case .getTransactionByHash(let transaction):
            return NSString(format: Constants.Path.getTransactionByHash, transaction).description
        case .getReceiptOfTransaction(let transaction):
            return NSString(format: Constants.Path.getTransactionByHash, transaction).description
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
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .sendTransaction:
            return nil
        default:
            return nil
        }
    }
    
    var extraHeaders: [String : String]? {
        switch self {
        case .getGasEstimate(let address, let data):
            return [Constants.Headers.address: address,
                    Constants.Headers.data: data]
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
