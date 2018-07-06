//
//  BitcoinWalletInterface.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var title: String = "Bitcoin"
}

public protocol BitcoinWalletInterface: WalletInterface {
    func getBalance(for address: String) -> Double
}

extension BitcoinWalletInterface {
    var title: String {
        return Constants.title
    }
}
