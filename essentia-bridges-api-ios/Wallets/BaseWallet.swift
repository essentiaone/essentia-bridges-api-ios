//
//  BaseWallet.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 06.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

public class BaseWallet {
    public init(_ serverUrl: String) {
        networking = NetworkManager(serverUrl)
    }
    
    public let networking: NetworkManagerInterface
}
