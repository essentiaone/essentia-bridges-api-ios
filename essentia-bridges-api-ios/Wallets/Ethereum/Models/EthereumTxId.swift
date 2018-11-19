//
//  EthereumTxId.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 11/19/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EthereumTxId: Decodable {
    public let txId: String
    
    enum CodingKeys: String, CodingKey {
        case txId = "result"
    }
}
