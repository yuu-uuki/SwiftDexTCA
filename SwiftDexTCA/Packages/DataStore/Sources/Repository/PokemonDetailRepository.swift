//
//  PokemonDetailRepository.swift
//  DataStore
//
//  Created by 田中裕貴 on 2025/03/26.
//

import Dependencies
import Foundation

public protocol PokemonDetailRepository: Sendable {
    func execute(pokemonId: String) async throws(ApplicationError) -> Components.Schemas.PokemonDetail
}

private struct PokemonDetailRepositoryImpl: PokemonDetailRepository {

    @Dependency(\.pokemonDetailDataStore) var pokemonDetailDataStore

    public func execute(pokemonId: String) async throws(ApplicationError) -> Components.Schemas.PokemonDetail {
        return try await pokemonDetailDataStore.execute(input: .init(path: .init(id: pokemonId)))
    }
}

extension PokemonDetailRepositoryImpl: DependencyKey {

    public static var liveValue: PokemonDetailRepository {
        PokemonDetailRepositoryImpl()
    }
}

extension DependencyValues {

    public var pokemonDetailRepository: PokemonDetailRepository {
        get { self[PokemonDetailRepositoryImpl.self] }
        set { self[PokemonDetailRepositoryImpl.self] = newValue }
    }
}
