//
//  BitcoinTransaction.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

public struct BitcoinTransactionVoutAddresses: Decodable {
    public let addresses: [String]
    
    enum CodingKeys: String, CodingKey {
        case addresses = "addresses"
    }
}
public struct BitcoinTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: BitcoinTransactionVoutAddresses
    public let spentTxId: String?
        
}
public struct BitcoinTransactionVin: Decodable {
    public let addr: String
    public let txid: String
    public let value: Double
    
    enum Codingkeys: String, CodingKey {
        case addr = "addr"
        case txid = "txid"
        case value = "value"
    }
}
public struct BitcoinTransactionValue: Decodable {
    public let blockhash: String
    public let blockheight: Int
    public let blocktime: Int
    public let confirmations: Int
    public let fees: Double
    public let size: Int
    public let time: Int
    public let txid: String
    public let valueIn: Double
    public let valueOut: Double
    
    public let vin: [BitcoinTransactionVin]
    public let vout: [BitcoinTransactionVout]
    

}
