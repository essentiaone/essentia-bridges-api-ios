//
//  DashEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import EssentiaNetworkCore

private enum Constants {
    enum Path {
        static var getBalance: NSString = "/dash/wallets/%@/balance"
        static var getUTxo: NSString = "/dash/wallets/%@/utxo/"
        static var getTransactionsHistory: NSString = "/dash/wallets/%@/transactions"
        static var getTransactionById: NSString = "/dash/transactions/%@"
        static var sendTransaction: String = "/dash/wallets/transactions"
    }
    
    enum Headers {
        static var data = "data"
    }
}

// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/dash.rst
enum DashEndpoint: RequestProtocol {
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
