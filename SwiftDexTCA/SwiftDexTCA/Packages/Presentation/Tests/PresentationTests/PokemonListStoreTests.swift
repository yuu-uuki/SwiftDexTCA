import ComposableArchitecture
import Testing
@testable import Presentation
@testable import Domain

private protocol PokemonListStoreTests {
    func fetchPokemonListSuccess() async
    func fetchPokemonListFailure() async
    func refreshPokemonList() async
    func bottomPagination() async
    func navigateToScreen() async
}

@MainActor @Suite("ポケモンリスト画面のテスト")
struct PokemonListStoreTestImpl: PokemonListStoreTests {

    var mockUseCase = PokemonListUseCaseMock()

    @Test("データ取得成功")
    func fetchPokemonListSuccess() async {
        let expectedPokemonList = [Pokemon(number: 1), Pokemon(number: 2)]
        let mockUseCase = mockUseCaseWithResponse(expectedPokemonList)
        let store = makeStore()
        store.dependencies.pokemonListUseCase = mockUseCase

        await store.send(.fetchInitialPokemonList) { state in
            state.initialLoading = false
        }
        await store.receive(.setPokemonList(expectedPokemonList)) { state in
            state.pokemonList = expectedPokemonList
            state.offset = expectedPokemonList.count
        }
        #expect(mockUseCase.executeCallCount == 1)
    }

    @Test("データ取得失敗")
    func fetchPokemonListFailure() async {
        let error: PokemonError = .network(.invalidResponse)
        let mockUseCase = mockUseCaseWithResponse(nil)
        let store = makeStore()
        store.dependencies.pokemonListUseCase = mockUseCase

        await store.send(.fetchInitialPokemonList) { state in
            state.initialLoading = false
        }
        await store.receive(.error(error)) { state in
            state.error = error
        }
        #expect(mockUseCase.executeCallCount == 1)
    }

    @Test("pull to refreshのテスト")
    func refreshPokemonList() async {
        let expectedPokemonList = [Pokemon(number: 1), Pokemon(number: 2)]
        let mockUseCase = mockUseCaseWithResponse(expectedPokemonList)
        let store = makeStore()
        store.dependencies.pokemonListUseCase = mockUseCase

        // データセット
        await store.send(.fetchInitialPokemonList) { state in
            state.initialLoading = false
        }
        await store.receive(.setPokemonList(expectedPokemonList)) { state in
            state.pokemonList = expectedPokemonList
            state.offset = expectedPokemonList.count
        }

        // リフレッシュ
        await store.send(.refreshPokemonList) { state in
            state.pokemonList.removeAll()
            state.offset = .zero
        }
        await store.receive(.setPokemonList(expectedPokemonList)) { state in
            state.pokemonList = expectedPokemonList
            state.offset = expectedPokemonList.count
        }
        #expect(mockUseCase.executeCallCount == 2)
    }

    @Test("bottomPaginationのテスト")
    func bottomPagination() async {
        let expectedPokemonList = [Pokemon(number: 1), Pokemon(number: 2)]
        let mockUseCase = mockUseCaseWithResponse(expectedPokemonList)
        let store = makeStore()
        store.dependencies.pokemonListUseCase = mockUseCase

        await store.send(.bottomPagination(0))
        await store.receive(.setPokemonList(expectedPokemonList)) { state in
            state.pokemonList = expectedPokemonList
            state.offset = expectedPokemonList.count
        }
        #expect(mockUseCase.executeCallCount == 1)
    }

    @Test("画面遷移のテスト")
    func navigateToScreen() async {
        let store = makeStore()

        await store.send(.navigateToScreen(.pokemonDetail(1))) { state in
            state.destination = .from(.pokemonDetail(1))
        }
    }
}

extension PokemonListStoreTestImpl {

    @MainActor
    private func makeStore() -> TestStore<PokemonListStore.State, PokemonListStore.Action> {
        return TestStore(initialState: PokemonListStore.State()) {
            PokemonListStore()
        }
    }

    private func mockUseCaseWithResponse(_ response: [Pokemon]?) -> PokemonListUseCaseMock {
        mockUseCase.executeHandler = { _, _ in
            guard let response else {
                throw PokemonError.network(.invalidResponse)
            }
            return response
        }
        return mockUseCase
    }
}
