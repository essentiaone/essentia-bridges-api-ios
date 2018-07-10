//
//  Wei+Codable.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 10.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import BigNumber

extension BInt {
    internal init(str: String, radix: Int) {
        self.init(0)
        let bint16 = BInt(16)
        var exp = BInt(1)
        str.reversed().forEach {
            guard let int = Int(String($0), radix: radix) else { return }
            let value = BInt(int)
            self += (value * exp)
            exp *= bint16
        }
    }
}

extension Wei: Codable {
    private enum CodingKeys: String, CodingKey {
        case bigInt
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let string = try container.decode(String.self, forKey: .bigInt)
        self = Wei(str: string, radix: 10)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(asString(radix: 10), forKey: .bigInt)
    }
}
