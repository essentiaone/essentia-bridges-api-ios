//
//  Logger.swift
//  essentia-bridges-api-ios
//
//  Created by Pavlo Boiko on 09.07.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

fileprivate enum Constants {
    static var unknownError = "Unknown error"
}

public class Logger {
    // MARK: - Singleton
    static public var shared: Logger {
        return Logger()
    }
    
    // MARK: - Internal
    internal func logEvent(_ event: LoggerEventType) {
        var message = event.consoleMarker
        switch event {
        case .httpRequest(let request):
            message.append(request.curlString)
        case .message(_, let msg):
            message.append(msg ?? Constants.unknownError)
        }
        consolePrintEvent(message: message)
    }
    
    // MARK: - Private
    private func consolePrintEvent(message: String) {
        debugPrint(message)
    }
}
