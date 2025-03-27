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

    @Dependency(\.pokemonDetailUseCase) var pokemonDetailUseCase

    @ObservableState
    struct State {
        @ObservationStateIgnored let pokemonId: Int
        var pokemonDetail: PokemonDetail?
        var error: PokemonError?
    }

    enum Action {
        case fetchPokemonDetail
        case setPokemonList(PokemonDetail)
        case error(PokemonError)
        case unowned
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchPokemonDetail:
                return .run { [id = state.pokemonId] send in
                    await send(await requestPokemonDetail(id: id))
                }
            case let .setPokemonList(pokemonDetail):
                state.pokemonDetail = pokemonDetail
                return .none
            case let .error(error):
                state.error = error
                return .none
            case .unowned:
                return .none
            }
        }
    }
}

extension PokemonDetailStore {

    func requestPokemonDetail(id: Int) async -> Action {
        do {
            let detail = try await pokemonDetailUseCase.execute(id: id)
            return .setPokemonList(detail)
        } catch let error as PokemonError {
            return .error(error)
        } catch {
            return .unowned
        }
    }
}
