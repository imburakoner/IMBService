//
//  URLSessionProtocol.swift
//  
//
//  Created by Burak Oner on 16.12.2021.
//

import Foundation

public typealias URLSessionCompletion = (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {
    func dataTask<Request: URLRequestConvertible>(with convertable: Request,
                                                         completion: @escaping URLSessionCompletion) -> DataTaskProtocol
}
