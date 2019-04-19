//
//  DashUTXO.swift
//  essentia-bridges-api-ios
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct DashUTXO: Decodable {
    public let address: String
    public let amount: Double
    public let confirmations: Int
    public let height: Int
    public let satoshis: Int
    public let scriptPubKey: String
    public let txid: String
    public let vout: Int
}
