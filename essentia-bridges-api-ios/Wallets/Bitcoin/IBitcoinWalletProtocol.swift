//
//  IBitcoinWalletProtocol.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public protocol IBitcoinWalletProtocol: IWalletProtocol {
    func getBalance(for adderess:String) -> Double
}

extension IBitcoinWalletProtocol {
    var title: String {
        return "Bitcoin"
    }
}
