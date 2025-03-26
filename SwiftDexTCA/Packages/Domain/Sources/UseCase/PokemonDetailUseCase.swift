//
//  PokemonDetailUseCase.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/26.
//

import DataStore
import Dependencies

/// @mockable
public protocol PokemonDetailUseCase: Sendable {
    func execute(id: Int) async throws -> PokemonDetail
}

private struct PokemonDetailUseCaseImpl: PokemonDetailUseCase {

    @Dependency(\.pokemonDetailRepository) var pokemonDetailRepository

    func execute(id: Int) async throws -> PokemonDetail {
        do {
            let data = try await pokemonDetailRepository.execute(pokemonId: id.description)
            return .init(data)
        } catch {
            throw PokemonError(error)
        }
    }
}

extension PokemonDetailUseCaseImpl: DependencyKey {

    public static var liveValue: PokemonDetailUseCase {
        PokemonDetailUseCaseImpl()
    }
}

extension DependencyValues {

    public var pokemonDetailUseCase: PokemonDetailUseCase {
        get { self[PokemonDetailUseCaseImpl.self] }
        set { self[PokemonDetailUseCaseImpl.self] = newValue }
    }
}
