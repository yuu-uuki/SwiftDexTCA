//
//  PokemonListRepository.swift
//  DataStore
//
//  Created by 田中裕貴 on 2025/03/18.
//

import Dependencies
import Foundation

public protocol PokemonListRepository: Sendable {
    func execute(limit: Int, offset: Int) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary]
}

private struct PokemonListRepositoryImpl: PokemonListRepository {

    @Dependency(\.pokemonListDataStore) var pokemonListDataStore

    func execute(limit: Int, offset: Int) async throws(ApplicationError) -> [Components.Schemas.PokemonSummary] {
        return try await pokemonListDataStore.execute(input: .init(query: .init(limit: limit, offset: offset)))
    }
}

extension PokemonListRepositoryImpl: DependencyKey {

    public static var liveValue: PokemonListRepository {
        PokemonListRepositoryImpl()
    }
}

extension DependencyValues {

    public var pokemonListRepository: PokemonListRepository {
        get { self[PokemonListRepositoryImpl.self] }
        set { self[PokemonListRepositoryImpl.self] = newValue }
    }
}
