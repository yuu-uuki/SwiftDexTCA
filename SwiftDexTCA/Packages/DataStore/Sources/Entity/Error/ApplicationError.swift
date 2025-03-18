//
//  ApplicationError.swift
//  DataStore
//
//  Created by 田中裕貴 on 2025/03/18.
//

import Foundation

public enum ApplicationError: Error {
    case network(NetworkError)

    public enum NetworkError: Error {
        case api(Error)
        case invalidResponse
    }
}
