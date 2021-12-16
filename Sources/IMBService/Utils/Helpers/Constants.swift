//
//  File.swift
//  
//
//  Created by Burak Oner on 16.12.2021.
//

import Foundation

public typealias ServiceResult<T: Decodable> = Result<T, ServiceError>
public typealias ServiceCompletion<T: Decodable> = (ServiceResult<T>) -> Void
