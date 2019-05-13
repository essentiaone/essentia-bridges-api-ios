//
//  UtxoResponce.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/13/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct UtxoResponce: Decodable {
    public let address: String
    public let amount: Double
    public let confirmations: Int
    public let height: Int
    public let satoshis: Int
    public let scriptPubKey: String
    public let txid: String
    public let vout: Int
}
