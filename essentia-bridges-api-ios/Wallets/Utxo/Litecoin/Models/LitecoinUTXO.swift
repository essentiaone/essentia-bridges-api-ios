//
//  LitecoinUTXO.swift
//  essentia-bridges-api-ios
//
//  Created by Binomial on 24.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct LitecoinUTXO: Decodable {
    public let address: String
    public let amount: Double
    public let confirmations: Int
    public let height: Int
    public let satoshis: Int
    public let scriptPubKey: String
    public let txid: String
    public let vout: Int
}
