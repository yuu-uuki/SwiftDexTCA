//
//  PokemonListUseCase.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore
import Dependencies

/// @mockable
public protocol PokemonListUseCase: Sendable {
    func execute(limit: Int, offset: Int) async throws -> [Pokemon]
}

private struct PokemonListUseCaseImpl: PokemonListUseCase {

    @Dependency(\.pokemonListRepository) var pokemonListRepository

    func execute(limit: Int, offset: Int) async throws -> [Pokemon] {
        do {
            let summaries = try await pokemonListRepository.execute(limit: limit, offset: offset)
            return summaries.compactMap { Pokemon($0) }
        } catch {
            throw PokemonError.init(error)
        }
    }
}

extension PokemonListUseCaseImpl: DependencyKey {

    public static var liveValue: PokemonListUseCase {
        PokemonListUseCaseImpl()
    }

    public static var previewValue: any PokemonListUseCase {
        let mockUseCase = PokemonListUseCaseMock()
        mockUseCase.executeHandler = { _, _ in
            (1...30).map { Pokemon(number: $0) }
        }
        return mockUseCase
    }
}

extension DependencyValues {

    public var pokemonListUseCase: PokemonListUseCase {
        get { self[PokemonListUseCaseImpl.self] }
        set { self[PokemonListUseCaseImpl.self] = newValue }
    }
}

