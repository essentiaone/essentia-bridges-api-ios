//
//  RequestBuilder.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 07.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static let contentType = "Content-Type"
}

class RequestBuilder {
    
    private let request: RequestProtocol
    
    init(request: RequestProtocol) {
        self.request = request
    }
    
    func build(for serverUrl: String) -> URLRequest {
        guard let url = URL(string: serverUrl + request.path) else {
            fatalError("Server url is not set")
        }
        var urlRequest: URLRequest = URLRequest(url: url)
        switch request.contentType {
        case .json:
            buildJson(for: &urlRequest)
        }
        setupHttpHeaders(for: &urlRequest)
        urlRequest.httpMethod = request.requestType.description
        return urlRequest
    }
    
    private func setupHttpHeaders(for urlRequest: inout URLRequest) {
        urlRequest.setValue(request.contentType.description, forHTTPHeaderField: Constants.contentType)
        guard let headers = request.extraHeaders else { return }
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func buildJson(for urlRequest: inout URLRequest) {
        guard let params = request.parameters,
              let data = try? JSONSerialization.data(withJSONObject: params,
                                                            options: .prettyPrinted) else {
            return
        }
        urlRequest.httpBody = data
    }
}
