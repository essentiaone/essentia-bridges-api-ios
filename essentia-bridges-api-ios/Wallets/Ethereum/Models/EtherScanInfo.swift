//
//  EtherScanInfo.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 18.09.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public struct EtherScanInfo {
    public init(url: String, apiKey: String) {
        self.url = url
        self.apiKey = apiKey
    }
    
    public let url: String
    public let apiKey: String
}
