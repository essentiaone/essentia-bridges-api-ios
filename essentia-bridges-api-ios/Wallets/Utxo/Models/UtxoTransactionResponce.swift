//
//  UtxoTransactionResponce.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/11/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public struct UtxoSendTXResponse: Decodable {
    public let txid: String
}
