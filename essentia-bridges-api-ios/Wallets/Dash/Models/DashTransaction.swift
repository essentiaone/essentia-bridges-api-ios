//
//  DashTransaction.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct DashTransactionVoutScriptPubKey: Decodable {
    public let addresses: [String]
    public let asm: String
    public let hex: String
    public let type: String
}

public struct DashTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: DashTransactionVoutScriptPubKey
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

public struct DashTransactionVin: Decodable {
    public let coinbase: String
    public let number: Int
    public let sequence: Int
    
    enum CodingKeys: String, CodingKey {
        case coinbase = "coinbase"
        case number = "n"
        case sequence = "sequence"
    }
    
}

public struct DashTransactionCbTx: Decodable {
    public let version: Int
    public let height: Int
    public let merkleRootMNList: String
}

public struct DashTransactionValue: Decodable {
    public let blockhash: String?
    public let blockheight: Int
    public let blocktime: Int?
    public let cbTx: DashTransactionCbTx
    public let confirmations: Int
    public let extraPayload: String
    public let extraPayloadSize: Int
    public let isCoinBase: Bool
    public let locktime: Int
    public let size: Int
    public let time: Int
    public let txid: String
    public let txlock: Bool
    public let type: Int
    public let valueOut: Double
    public let version: Int
    public let vin: [DashTransactionVin]
    public let vout: [DashTransactionVout]
}
