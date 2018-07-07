//
//  URLRequest+RequestProtocol.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static let contentType = "Content-Type"
}

extension RequestProtocol {
    func makeUrlRequest() -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: url)
        switch contentType {
        case .json:
            buildJsonRequest(request: &urlRequest)
        }
        setupHttpHeaders(request: &urlRequest)
        urlRequest.httpMethod = requestType.description
        return urlRequest
    }
    
    private func setupHttpHeaders(request: inout URLRequest) {
        request.setValue(contentType.description, forHTTPHeaderField: Constants.contentType)
        guard let headers = extraHeaders else { return }
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func buildJsonRequest(request: inout URLRequest) {
        guard let params = parameters,
            let data = try? JSONSerialization.data(withJSONObject: params,
                                                   options: .prettyPrinted) else {
                return
            }
        request.httpBody = data
    }
}
