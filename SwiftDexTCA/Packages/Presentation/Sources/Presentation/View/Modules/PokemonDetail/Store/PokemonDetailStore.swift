//
//  PokemonDetailStore.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/24.
//

import ComposableArchitecture
import Domain

@Reducer
struct PokemonDetailStore: Sendable {

    @ObservableState
    struct State {
    }

    enum Action {
        case fetchData
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchData:
                return .none
            }
        }
    }
}

