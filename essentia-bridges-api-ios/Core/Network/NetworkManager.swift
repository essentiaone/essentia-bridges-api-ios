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
            URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
                self.handleResponse(responce: (data, error), success: success, failure: failure)
                }.resume()
        }
        Logger.shared.logEvent(.httpRequest(urlRequest))
    }
    
    private func handleResponse<SuccessModel: Codable, ErrorModel: Codable> (
            responce: (Data?, Error?),
            success: @escaping (SuccessModel) -> Void,
            failure: @escaping (ErrorModel?) -> Void
        ) {
        OperationQueue.main.addOperation {
            guard let data = responce.0 else {
                failure(nil)
                return
            }
            let decoder = JSONDecoder()
            guard let object = try? decoder.decode(SuccessModel.self, from: data) else {
                self.handleError(responce: data, failure: failure)
                return
            }
            success(object)
        }
    }
    
    private func handleError<ErrorModel: Codable> (
            responce: Data,
            failure: @escaping (ErrorModel?) -> Void
        ) {
        let decoder = JSONDecoder()
        guard let failedObject = try? decoder.decode(ErrorModel.self, from: responce) else {
            Logger.shared.logEvent(.message(.error, String(data: responce, encoding: .utf8)))
            failure(nil)
            return
        }
        Logger.shared.logEvent(.message(.error, String(describing: failedObject)))
        failure(failedObject)
    }
}
