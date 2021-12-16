//
//  URLRequestConvertible.swift
//  
//
//  Created by Burak Oner on 16.12.2021.
//

import Foundation

public protocol URLRequestConvertible {

    associatedtype RequestModel: Encodable
    associatedtype ResponseModel: Decodable

    var requestModel: RequestModel { get }

    var httpMethod: HTTPMethod { get }

    func convert() -> URLRequest
}

