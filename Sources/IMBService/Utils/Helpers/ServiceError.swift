//
//  File.swift
//  
//
//  Created by Burak Oner on 16.12.2021.
//

import Foundation

public enum ServiceError: Int, Error {
    case unknown = 0
    case decoding
    case requestCreation
    case noInternetConnection = -1009
    case badURL = -1000
}

extension ServiceError {
    init(withError error: Error) {
        let error = error as NSError
        self = Self(rawValue: error.code) ?? .unknown
    }
}
