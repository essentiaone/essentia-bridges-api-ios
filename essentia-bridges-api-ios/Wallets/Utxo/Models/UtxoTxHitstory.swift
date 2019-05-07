//
//  UtxoTxHitstory.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/7/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public protocol UtxoTxHistoryInterface {
    var time: Int { get }
    var txid: String { get }
    var vin: [String: Double] { get }
    var vout: [String: Double] { get }
}
