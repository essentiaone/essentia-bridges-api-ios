//
//  LitecoinEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

fileprivate enum Constants {
    enum Path {
        static var getBalance: NSString = "/litecoin/wallets/%@/balance"
        static var getUTxo: NSString = "/litecoin/wallets/%@/utxo/"
        static var getTransactionsHistory: NSString = "/litecoin/wallets/%@/transactions"
        static var getTransactionById: NSString = "/litecoin/transactions/%@"
        static var sendTransaction: String = "/litecoin/wallets/transactions"
    }
    
    enum Headers {
        static var address = "address"
        static var data = "data"        
    }
    
    enum Body {
        static var body = "body"
        static var toAddress = "to"
    }
}

// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/litecoin.rst
enum LitecoinEndpoint: RequestProtocol {
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
        case .getTransactionById(let id):
            return NSString(format: Constants.Path.getTransactionById, id).description
        case .sendTransaction:
            return Constants.Path.sendTransaction
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .sendTransaction(let withData):
            return [Constants.Body.body: withData]
        default:
            return nil
        }
    }
    
    var extraHeaders: [String : String]? {
        switch self {
        default:
            return nil
        }
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
