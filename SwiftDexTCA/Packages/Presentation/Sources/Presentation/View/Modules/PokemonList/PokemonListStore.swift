//
//  PokemonListStore.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/19.
//

import ComposableArchitecture
import Domain
import Foundation

@Reducer
struct PokemonListStore: Sendable {

    @Dependency(\.pokemonListUseCase) var pokemonListUseCase

    @ObservableState
    struct State {
        var pokemonList: [Pokemon] = []
        var error: PokemonError? = nil

        @ObservationStateIgnored
        var offset: Int = 0
    }

    enum Action {
        case fetchInitialPokemonList(Int)
        case setPokemonList([Pokemon])
        case bottomPagination(Int)
        case navigateToDetail

        case error(PokemonError)
        case unowned
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .fetchInitialPokemonList(offset):
                state.pokemonList.removeAll()
                state.offset = .zero
                return .run { send in
                    await send(await requestPokemonList(offset: offset))
                }
            case let .setPokemonList(pokemonList):
                state.pokemonList.append(contentsOf: pokemonList)
                state.offset += pokemonList.count
                return .none
            case let .bottomPagination(number):
                return .run { [offset = state.offset] send in
                    await send(await bottomPagination(number: number, offset: offset))
                }
            case .navigateToDetail:
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

private extension PokemonListStore {

    func requestPokemonList(offset: Int) async -> Action {
        do {
            let pokemonList = try await pokemonListUseCase.execute(limit: 50, offset: offset)
            return .setPokemonList(pokemonList)
        } catch let error as PokemonError {
            return .error(error)
        } catch {
            return .unowned
        }
    }

    func bottomPagination(number: Int, offset: Int) async -> Action {
        guard number == offset else {
            return .unowned
        }
        return await requestPokemonList(offset: number)
    }
}
