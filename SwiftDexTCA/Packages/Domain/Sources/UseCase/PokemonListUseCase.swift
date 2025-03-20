//
//  PokemonListUseCase.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore
import Dependencies

public protocol PokemonListUseCase: Sendable {
    func execute(limit: Int, offset: Int) async throws(PokemonError) -> [Pokemon]
}

public struct PokemonListUseCaseImpl: PokemonListUseCase {

    @Dependency(\.pokemonListRepository) var pokemonListRepository

    public func execute(limit: Int, offset: Int) async throws(PokemonError) -> [Pokemon] {
        do {
            let summaries = try await pokemonListRepository.execute(limit: limit, offset: offset)
            return summaries.map { Pokemon($0) }
        } catch {
            throw .init(error)
        }
    }
}

extension PokemonListUseCaseImpl: DependencyKey {
    public static var liveValue: PokemonListUseCase {
        PokemonListUseCaseImpl()
    }
}

extension DependencyValues {
    public var pokemonListUseCase: PokemonListUseCase {
        get { self[PokemonListUseCaseImpl.self] }
        set { self[PokemonListUseCaseImpl.self] = newValue }
      }
}

