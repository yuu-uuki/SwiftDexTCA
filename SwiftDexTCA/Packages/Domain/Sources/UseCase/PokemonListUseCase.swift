//
//  PokemonListUseCase.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore

public enum PokemonListUseCaseProvider {

    public static func provide() -> PokemonListUseCase {
        return PokemonListUseCaseImpl(
            repository: PokemonListRepositoryProvider.provider()
        )
    }
}

public protocol PokemonListUseCase {
    func execute(limit: Int, offset: Int) async throws(PokemonError) -> [Pokemon]
}

private struct PokemonListUseCaseImpl: PokemonListUseCase {

    let repository: PokemonListRepository

    func execute(limit: Int, offset: Int) async throws(PokemonError) -> [Pokemon] {
        do {
            let summaries = try await repository.execute(limit: limit, offset: offset)
            return summaries.map { Pokemon($0) }
        } catch {
            throw .init(error)
        }
    }
}
