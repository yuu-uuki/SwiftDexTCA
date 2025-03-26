//
//  PokemonDetailDestination.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/26.
//

import ComposableArchitecture

@Reducer
struct PokemonDetailDestination: Sendable {

    enum State {
        case none
    }

    enum Action {
        case none
    }

    var body: some Reducer<State, Action> {
        EmptyReducer()
    }
}

extension PokemonDetailDestination.State {

    /// `navigateToScreen(_:)` で `destination` をセットする際に使用
    static func from(_ type: PokemonDetailDestination.DestinationType) -> Self {
        switch type {
        case .none:
            return .none
        }
    }
}

extension PokemonDetailDestination {

    /// 画面遷移用のenum
    enum DestinationType {
        case none
    }
}
