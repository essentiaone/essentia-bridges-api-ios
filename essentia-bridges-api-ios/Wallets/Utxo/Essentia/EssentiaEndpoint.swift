//
//  EssentiaEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 6/11/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

private enum Constants {
    enum Path {
        static var getBalance: NSString = "/essentia/wallets/%@/balance"
        static var getUTxo: NSString = "/essentia/wallets/%@/utxo/"
        static var getTransactionsHistory: NSString = "/essentia/wallets/%@/transactions"
        static var getTransactionById: NSString = "/essentia/transactions/%@"
        static var sendTransaction: String = "/essentia/wallets/transactions"
    }
    
    enum Headers {
        static var data = "data"
    }
}

// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/essentia.rst
enum EssentiaEndpoint: RequestProtocol {
    case getBalance(Address)
    case getUTxo(Address)
    case getTransactionsHistory(Address)
    case getTransactionById(TransactionId)
    case sendTransaction(withData: TransactionData)
    
    var path: String {
        switch self {
        case .getBalance(let address):
            return NSString(format: Constants.Path.getBalance, address).description
        case .getUTxo(let address):
            return NSString(format: Constants.Path.getUTxo, address).description
        case .getTransactionsHistory(let address):
            return NSString(format: Constants.Path.getTransactionsHistory, address).description
        case .getTransactionById(let txId):
            return NSString(format: Constants.Path.getTransactionById, txId).description
        case .sendTransaction:
            return Constants.Path.sendTransaction
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .sendTransaction(let withData):
            return [Constants.Headers.data: withData]
        default:
            return nil
        }
    }
    
    var extraHeaders: [String: String]? {
        return nil
        
    }
    
    var requestType: RequestType {
        switch self {
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

