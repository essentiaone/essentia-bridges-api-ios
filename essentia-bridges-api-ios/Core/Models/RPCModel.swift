//
//  RPCModel.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 11.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

class RPCObject: Decodable {
    let jsonrpc: String
    let rpcId: Int
    
    enum CodingKeys: String, CodingKey {
        case jsonrpc, rpcId = "id"
    }
}
