//
//  UtxoTransactionValue.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/13/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct UtxoTransactionVoutAddresses: Decodable {
    public let addresses: [String]
    public let asm: String
    public let hex: String
    public let type: String
}
public struct UtxoTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: UtxoTransactionVoutAddresses
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

public struct UtxoTransactionScriptSig: Decodable {
    public let asm: String
    public let hex: String
}

public struct UtxoTransactionVin: Decodable {
    public let addr: String?
    public let txid: String?
    public let value: Double?
    public let doubleSpentTxID: String?
    public let number: Int
    public let scriptSig: UtxoTransactionScriptSig?
    public let coinbase: String?
    public let sequence: Int
    public let valueSat: Int?
    public let vout: Int?
    
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
        case coinbase = "coinbase"
    }
    
}

public struct UtxoTransactionValue: Decodable {
    public let blockhash: String?
    public let blockheight: Int?
    public let blocktime: Int?
    public let confirmations: Int
    public let fees: Double?
    public let locktime: Int
    public let extraPayloadSize: Int?
    public let extraPayload: String?
    public let size: Int
    public let time: Int
    public let txid: String
    public let valueIn: Double?
    public let valueOut: Double
    public let version: Int
    public let vin: [UtxoTransactionVin]
    public let vout: [UtxoTransactionVout]
}
