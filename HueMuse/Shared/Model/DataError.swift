//
//  DataError.swift
//  HueMuse
//
//  Created by Deirdre Saoirse Moen on 2/19/21.
//

import Foundation

enum DataError: Error {
    case urlError
    case networkUnavailable
    case wrongDataFormat
}

extension DataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlError:
            return NSLocalizedString("Couldn't create URL.", comment: "")
        case .networkUnavailable:
            return NSLocalizedString("Can't reach remote server.", comment: "")
        case .wrongDataFormat:
            return NSLocalizedString("Wrong data format, can't parse.", comment: "")
        }
    }
}
