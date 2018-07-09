//
//  URLRequest+curl.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var curlPrefix = "curl"
    static var curlPostfix = "\\\n\t"
    static var headMethod = "HEAD"
    static var headCommand = " --head"
    static var requestTypePrefix = "-X"
    static var requestHeaderPrefix = "-H"
    static var requestBodyPrefix = "-d"
    static var cookie = "Cookie"
}

extension URLRequest {
    public var curlString: String {
        guard let url = url else { return "" }
        var baseCommand = "\(Constants.curlPrefix) \(url.absoluteString)"
        
        if httpMethod == Constants.headMethod {
            baseCommand += Constants.headCommand
        }
        
        var command = [baseCommand]
        
        if let method = httpMethod, method != RequestType.get.description && method != RequestType.head.description {
            command.append("\(Constants.requestTypePrefix) \(method)")
        }
        
        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != Constants.cookie {
                command.append("\(Constants.requestHeaderPrefix) '\(key): \(value)'")
            }
        }
        
        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("\(Constants.requestBodyPrefix) '\(body)'")
        }
        
        return command.joined(separator: " \(Constants.curlPostfix)")
    }
}
