//
//  LitecoinTransaction.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct LitecoinTransactionVoutScriptPubKey: Decodable {
    public let addresses: [String]
    public let asm: String
    public let hex: String
    public let type: String
}

public struct LitecoinTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: LitecoinTransactionVoutScriptPubKey
    public let spentTxId: String?
    public let spentHeight: Int?
    public let spentIndex: Int?
    public let number: Int
    
    enum CodingKeys: String, CodingKey {
        case number = "n"
        case value = "value"
        case scriptPubKey = "scriptPubKey"
        case spentTxId = "spentTxId"
        case spentHeight = "spentHeight"
        case spentIndex = "spentIndex"
        
    }
    
}

public struct LitecoinTransactionScriptSig: Decodable {
    public let asm: String
    public let hex: String
}

public struct LitecoinTransactionVin: Decodable {
    public let addr: String
    public let txid: String
    public let value: Double
    public let doubleSpentTxID: String?
    public let number: Int
    public let scriptSig: LitecoinTransactionScriptSig
    public let sequence: Int
    public let valueSat: Int
    public let vout: Int
    
    enum CodingKeys: String, CodingKey {
        case addr = "addr"
        case txid = "txid"
        case value = "value"
        case doubleSpentTxID = "doubleSpentTxID"
        case number = "n"
        case scriptSig = "scriptSig"
        case sequence = "sequence"
        case valueSat = "valueSat"
        case vout = "vout"
    }
    
}

public struct LitecoinTransactionValue: Decodable, UtxoTxHistoryInterface {
    public let blockhash: String?
    public let blockheight: Int
    public let blocktime: Int?
    public let confirmations: Int
    public let fees: Double
    public let locktime: Int
    public let size: Int
    public let time: Int
    public let txid: String
    public let valueIn: Double
    public let valueOut: Double
    public let version: Int    
    public let vin: [LitecoinTransactionVin]
    public let vout: [LitecoinTransactionVout]
    
    public var vinTx: [[String: Double]] {
        return vin.map { return [$0.addr: $0.value] }
    }
    
    public var voutTx: [[String: Double]] {
        return vout.compactMap {
            guard let address = $0.scriptPubKey.addresses.first,
                let value = Double($0.value) else {
                    return nil
            }
            return [address: value]
        }
    }
}
