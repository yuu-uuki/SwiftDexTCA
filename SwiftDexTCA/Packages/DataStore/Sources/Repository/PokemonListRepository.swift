//
//  PokemonListRepository.swift
//  DataStore
//
//  Created by 田中裕貴 on 2025/03/18.
//

import Foundation

public enum PokemonListRepositoryProvider {

    public static func provider() -> PokemonListRepository {
        return PokemonListRepositoryImpl(
            dataStore: PokemonListDataStoreProvider.provide()
        )
    }
}

public protocol PokemonListRepository {
    func execute(limit: Int, offset: Int) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary]
}

private struct PokemonListRepositoryImpl: PokemonListRepository {

    let dataStore: PokemonListDataStore

    func execute(limit: Int, offset: Int) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary] {
        return try await dataStore.execute(input: .init(query: .init(limit: limit, offset: offset)))
    }
}
