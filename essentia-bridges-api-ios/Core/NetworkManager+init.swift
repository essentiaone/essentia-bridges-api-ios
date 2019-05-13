//
//  NetworkManager+init.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 5/13/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import Foundation
import EssentiaNetworkCore

extension NetworkResult {
    func adapt<Output>(adapting: (Object) -> Output) -> NetworkResult<Output> {
        switch self {
        case .success(let object):
            return .success(adapting(object))
        case .failure(let error):
            return .failure(error)
        }
    }
}
