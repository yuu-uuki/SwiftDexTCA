//
//  PokemonListReducer.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/19.
//

import ComposableArchitecture
import Domain
import Foundation

@Reducer
struct PokemonListReducer : Sendable{

    @Dependency(\.pokemonListUseCase) var pokemonListUseCase

    @ObservableState
    struct State {
        var pokemons: [Pokemon] = []
        var error: PokemonError? = nil
    }

    enum Action {
        case onAppear
        case setPokemons([Pokemon])
        case error(PokemonError)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(await requestPokemonList())
                }
            case let .setPokemons(pokemons):
                state.pokemons = pokemons
                return .none
            case let .error(error):
                state.error = error
                return .none
            }
        }
    }
}

extension PokemonListReducer {

    private func requestPokemonList() async -> Action {
        do {
            let pokeomons = try await pokemonListUseCase.execute(limit: 20, offset: 1)
            return .setPokemons(pokeomons)
        } catch {
            return .error(error)
        }
    }
}
