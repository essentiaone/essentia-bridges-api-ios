//
//  BridgesApiError.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public enum BridgesApiError: Error, Decodable {
    case error(ErrorMessage)
    case unknownError
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            let leftValue =  try container.decode(ErrorMessage.self, forKey: .error)
            self = .error(leftValue)
        } catch {
            self = .unknownError
        }
    }
    
    enum CodingKeys: CodingKey {
        case unknownError, error
    }
}
