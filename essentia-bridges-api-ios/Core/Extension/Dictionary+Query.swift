//
//  Dictionary+Query.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var concatSymbol = "&"
}

extension Dictionary {
    var createQueryString: String? {
        var pairs: [String] = []
        for (key, value) in self {
            if let object = value as Any? {
                let stringValue: String? = self.stringFrom(object: object)
                if stringValue != nil {
                    pairs.append("\(key)=\(stringValue!)")
                }
            }
        }
        return pairs.joined(separator: Constants.concatSymbol)
    }
    
    private func stringFrom(object: Any) -> String? {
        if (object is Dictionary) || (object is [String]) {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
                return nil
            }
            let jsonString = String(bytes: jsonData, encoding: .utf8)
            return self.escaped(string: jsonString)
        } else {
            return self.escaped(string: String(describing: object))
        }
    }
    
    private func escaped(string: String?) -> String? {
        return string?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    public mutating func update(other: Dictionary) {
        for (key, value) in other {
            self.updateValue(value, forKey: key)
        }
    }
}
