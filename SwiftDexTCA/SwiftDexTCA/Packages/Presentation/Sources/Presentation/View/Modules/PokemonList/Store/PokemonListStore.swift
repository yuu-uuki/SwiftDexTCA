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
        var error: PokemonError?
        @Presents var destination: PokemonListDestination.State?
        @ObservationStateIgnored var offset: Int = 0
        @ObservationStateIgnored var initialLoading = true
    }

    enum Action {
        case fetchInitialPokemonList
        case refreshPokemonList
        case setPokemonList([Pokemon])
        case bottomPagination(Int)

        case error(PokemonError)
        case unowned

        case destination(PresentationAction<PokemonListDestination.Action>)
        case navigateToScreen(PokemonListDestination.DestinationType)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchInitialPokemonList:
                guard state.initialLoading else {
                    return .none
                }
                state.initialLoading = false
                return .run { send in
                    await send(await requestPokemonList(offset: .zero))
                }
            case .refreshPokemonList:
                state.pokemonList.removeAll()
                state.offset = .zero
                return .run { send in
                    await send(await requestPokemonList(offset: .zero))
                }
            case let .setPokemonList(pokemonList):
                state.pokemonList.append(contentsOf: pokemonList)
                state.offset += pokemonList.count
                return .none
            case let .bottomPagination(number):
                return .run { [offset = state.offset] send in
                    await send(await bottomPagination(number: number, offset: offset))
                }
            case .destination:
                return .none
            case let .navigateToScreen(type):
                state.destination = .from(type)
                return .none
            case let .error(error):
                state.error = error
                return .none
            case .unowned:
                return .none
            }
        }.ifLet(\.$destination, action: \.destination) {
            PokemonListDestination()
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
