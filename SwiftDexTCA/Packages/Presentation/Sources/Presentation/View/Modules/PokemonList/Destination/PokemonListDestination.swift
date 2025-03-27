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

extension PokemonListDestination.State {

    /// `navigateToScreen(_:)` で `destination` をセットする際に使用
    static func from(_ type: PokemonListDestination.DestinationType) -> Self {
        switch type {
        case let .pokemonDetail(id):
            return .pokemonDetail(PokemonDetailStore.State(pokemonId: id))
        }
    }
}

extension PokemonListDestination {

    /// 画面遷移用のenum
    enum DestinationType {
        case pokemonDetail(Int)
    }
}
