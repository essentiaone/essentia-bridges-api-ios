//
//  BitcoinCashTransactionsHistory.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/14/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation

public struct BitcoinCashTransactionsHistory: Decodable {
    public var result: UtxoTransactionsHistory
}
