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
}

public struct LitecoinTransactionVout: Decodable {
    public let value: String
    public let scriptPubKey: LitecoinTransactionVoutAddresses   
}

public struct LitecoinTransactionVin: Decodable {
    public let addr: String
    public let txid: String
    public let value: Double
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
}

