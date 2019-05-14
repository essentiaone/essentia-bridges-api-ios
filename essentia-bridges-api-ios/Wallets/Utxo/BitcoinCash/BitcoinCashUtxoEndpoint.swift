//
//  BitcoinCashUtxoEndpoint.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/10/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

class BitcoinCashUtxoEndpoint: RequestProtocol {
    var parameters: [String: Any]?
    var extraHeaders: [String: String]?
    var requestType: RequestType = .get
    var contentType: RequestContentType = .json
    let address: String
    
    init(_ address: String) {
        self.address = address
    }
    
    var path: String {
        return "api/addr/\(address)/utxo"
    }
}
