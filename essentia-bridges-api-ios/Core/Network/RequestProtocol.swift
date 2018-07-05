//
//  RequestProtocol.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var jsonContentType = "application/json"
}

enum TypeRequest {
    case post, get, put, patch, delete, head, trace, connect
    var description: String {
        return String(describing: self).uppercased()
    }
}

enum ContentTypeRequest {
    case json
    var description: String {
        switch self {
        case .json:
            return Constants.jsonContentType
        }
    }
}

protocol RequestProtocol {
    var url: URL { get }
    var extraHeaders: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var requestType: TypeRequest { get }
    var contentType: ContentTypeRequest { get }
}
