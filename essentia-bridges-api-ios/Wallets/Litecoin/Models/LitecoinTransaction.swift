//
//  LitecoinTransaction.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation


public struct LitecoinTransactionVoutAddresses: Decodable {
    public let addresses: [String]
    
    enum CodingKeys: String, CodingKey {
        case addresses = "addresses"
    }
}

public struct LitecoinTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: LitecoinTransactionVoutAddresses
    
    enum Codingkeys: String, CodingKey {
        case value = "value"
        case scriptPubKey = "scriptPubKey"
    }
}

public struct LitecoinTransactionVin: Decodable {
    public let addr: String
    public let txid: String
    public let value: Double
    
    enum Codingkeys: String, CodingKey {
        case addr = "addr"
        case txid = "txid"
        case value = "value"
    }
}

public struct LitecoinTransactionValue: Decodable {
    public let blockhash: String
    public let blockheight: Int
    public let blocktime: Int
    public let fees: Double
    public let size: Int
    public let time: Int
    public let txid: String
    public let valueIn: Double
    public let valueOut: Double
    
    public let vin: [LitecoinTransactionVin]
    public let vout: [LitecoinTransactionVout]
    
    enum CodingKeys: CodingKey, String {
        case blockhash = "blockhash"
        case blockheight = "blockheight"
        case blocktime = "blocktime"
        case fees = "fees"
        case size = "size"
        case time = "time"
        case txid = "txid"
        case valueIn = "valueIn"
        case valueOut = "valueOut"
        case vin = "vin"
        case vout = "vout"
    }
}

