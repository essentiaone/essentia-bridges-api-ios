//
//  NetworkManager.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 05.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerInterface {
    func makeRequest<SuccessModel: Codable, ErrorModel: Codable> (
            _ request: RequestProtocol,
            success: @escaping (SuccessModel) -> Void,
            failure: @escaping (ErrorModel?) -> Void
        ) {
        let requestBuilder = RequestBuilder(request: request)
        let urlRequest = requestBuilder.buildUrlRequest()
        switch request.contentType {
        case .json:
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                self.handleResponse(response: (data, error), success: success, failure: failure)
            }.resume()
        }
        Logger.shared.logEvent(.httpRequest(urlRequest))
    }
    
    private func handleResponse<SuccessModel: Codable, ErrorModel: Codable> (
            response: (Data?, Error?),
            success: @escaping (SuccessModel) -> Void,
            failure: @escaping (ErrorModel?) -> Void
        ) {
        OperationQueue.main.addOperation {
            guard let data = response.0 else {
                failure(nil)
                return
            }
            let decoder = JSONDecoder()
            guard let object = try? decoder.decode(SuccessModel.self, from: data) else {
                self.handleError(response: data, failure: failure)
                return
            }
            success(object)
        }
    }
    
    private func handleError<ErrorModel: Codable> (
            response: Data,
            failure: @escaping (ErrorModel?) -> Void
        ) {
        let decoder = JSONDecoder()
        guard let failedObject = try? decoder.decode(ErrorModel.self, from: response) else {
            Logger.shared.logEvent(.message(.error, String(data: response, encoding: .utf8)))
            failure(nil)
            return
        }
        Logger.shared.logEvent(.message(.error, String(describing: failedObject)))
        failure(failedObject)
    }
}
