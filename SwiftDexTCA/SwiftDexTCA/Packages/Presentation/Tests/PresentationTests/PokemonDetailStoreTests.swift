//
//  PokemonDetailStoreTests.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/28.
//

import ComposableArchitecture
import Testing
@testable import Presentation
@testable import Domain

private protocol PokemonDetailStoreTests {
    func fetchPokemonDetailSuccess() async
    func fetchPokemonDetailFailure() async
}

@MainActor @Suite("ポケモン詳細画面のテスト")
struct PokemonDetailStoreImpl: PokemonDetailStoreTests {

    var mockUseCase = PokemonDetailUseCaseMock()

    @Test("データ取得成功")
    func fetchPokemonDetailSuccess() async {
        let expectedPokemonDetail = PokemonDetail(number: 1)
        let store = makeStore(id: 1)
        let mockUseCase = mockUseCaseWithResponse(expectedPokemonDetail)
        store.dependencies.pokemonDetailUseCase = mockUseCase

        await store.send(.fetchPokemonDetail)
        await store.receive(.setPokemonData(expectedPokemonDetail)) { state in
            state.pokemonDetail = expectedPokemonDetail
        }
        #expect(mockUseCase.executeCallCount == 1)
    }

    @Test("データ取得失敗")
    func fetchPokemonDetailFailure() async {
        let error: PokemonError = .network(.invalidResponse)
        let store = makeStore(id: 1)
        let mockUseCase = mockUseCaseWithResponse(nil)
        store.dependencies.pokemonDetailUseCase = mockUseCase

        await store.send(.fetchPokemonDetail)
        await store.receive(.error(error)) { state in
            state.error = error
        }
        #expect(mockUseCase.executeCallCount == 1)
    }
}

extension PokemonDetailStoreImpl {

    @MainActor
    private func makeStore(id: Int) -> TestStore<PokemonDetailStore.State, PokemonDetailStore.Action> {
        return TestStore(initialState: PokemonDetailStore.State(pokemonId: id)) {
            PokemonDetailStore()
        }
    }

    private func mockUseCaseWithResponse(_ response: PokemonDetail?) -> PokemonDetailUseCaseMock {
        mockUseCase.executeHandler = { _ in
            guard let response else {
                throw PokemonError.network(.invalidResponse)
            }
            return response
        }
        return mockUseCase
    }
}
