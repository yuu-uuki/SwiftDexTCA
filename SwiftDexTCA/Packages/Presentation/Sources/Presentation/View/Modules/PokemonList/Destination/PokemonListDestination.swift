//
//  PokemonListDestination.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/25.
//
import ComposableArchitecture

@Reducer
struct PokemonListDestination: Sendable {

    enum State {
        case pokemonDetail(PokemonDetailStore.State)
    }

    enum Action {
        case pokemonDetail(PokemonDetailStore.Action)
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.pokemonDetail, action: \.pokemonDetail) {
            PokemonDetailStore()
        }
    }
}
