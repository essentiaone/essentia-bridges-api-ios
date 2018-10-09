//
//  BitcoinCashEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 27.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

private enum Constants {
    enum Path {
        static var getBalance: NSString = "/third-party/bitcoin-cash/explorer-bitcoin/details/%@/balance"
        static var getTxHistory: NSString = "/third-party/bitcoin-cash/explorer-bitcoin/details/%@/transactions"
        static var getTransactionById: NSString = "/third-party/bitcoin-cash/explorer-bitcoin/transactions/%@"
        static var sendRawTransaction: String = "/third-party/bitcoin-cash/explorer-bitcoin/rawtransactions"
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
// MARK: - https://github.com/essentiaone/ess-bridge-wallet/blob/develop/docs/source/rest/wallet/bitcoincash.rst
enum BitcoinCashEndpoint: RequestProtocol {
    case getBalance(Address)
    case getTransactionsHistory(Address)
    case getTransactionById(TransactionId)
    case sendRawTransaction(withData: TransactionData)
    
    var path: String {
        switch self {
        case .getBalance(let address):
            return NSString(format: Constants.Path.getBalance, address).description
        case .getTransactionsHistory(let address):
            return NSString(format: Constants.Path.getTxHistory, address).description
        case .getTransactionById(let txId):
            return NSString(format: Constants.Path.getTransactionById, txId).description
        case .sendRawTransaction:
            return Constants.Path.sendRawTransaction
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .sendRawTransaction(let withData):
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
        case .sendRawTransaction:
            return .post
        default:
            return .get
        }
    }
    
    var contentType: RequestContentType {
        return .json
    }
    
}
