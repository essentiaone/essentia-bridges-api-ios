//
//  Result.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

public enum Result<Object: Decodable> {
    case success(Object)
    case failure(BridgesApiError)
    
    /// For debug use only
    public var description: String {
        switch self {
        case .success(let object):
            return "success: \(object)"
        case .failure(let error):
            return "failed: \(error)"
        }
    }
}
