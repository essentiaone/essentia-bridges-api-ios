//
//  BItcoinUTXO.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct BitcoinUTXO: Decodable {
    public let address: String
    public let amount : Double
    public let confirmations: Int
    public let height: Int
    public let satoshis: Int
    public let scriptPubKey: String
    public let txid: String
    public let vout: Int
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case amount = "amount"
        case confirmations = "confirmations"
        case height = "height"
        case satoshis = "satoshis"
        case scriptPubKey = "scriptPubKey"
        case txid = "txid"
        case vout = "vout"
    }
}
