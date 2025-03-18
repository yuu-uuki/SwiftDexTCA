//
//  PokemonError.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore
import Foundation

public enum PokemonError: Error {
    case network(NetworkError)

    init(_ error: ApplicationError) {
        switch error {
        case let .network(error):
            self = .network(.init(error))

        }
    }

    public enum NetworkError: Error {
        case api(Error)
        case invalidResponse

        init(_ networkError: ApplicationError.NetworkError) {
            switch networkError {
            case .api(let error):
                self = .api(error)
            case .invalidResponse:
                self = .invalidResponse
            }
        }
    }
}
