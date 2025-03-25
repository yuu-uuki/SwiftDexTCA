//
//  PokemonListView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/23.
//

import SwiftUI
import ComposableArchitecture

struct PokemonListView: View {

    @Bindable var store: StoreOf<PokemonListStore>

    var body: some View {
        NavigationStack {
            content()
                .navigationTitle("Pokemon")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(
                    item: $store.scope(
                        state: \.destination?.showPokemonDetail,
                        action: \.destination.showPokemonDetail
                    )
                ) { store in
                    PokemonDetailView(store: store)
                }
        }
    }
}

private extension PokemonListView {

    func content() -> some View {
        ScrollView {
            ZStack {
                Color(.pokemonBg)
                gridView()
            }
        }
        .onAppear {
            store.send(.fetchInitialPokemonList(.zero))
        }
        .refreshable {
            store.send(.fetchInitialPokemonList(.zero))
        }
    }

    func gridView() -> some View {
        LazyVGrid(columns: Token.GridLayout.threeColumns, spacing: Token.Spacing.normal) {
            ForEach(store.state.pokemonList, id: \.id) { pokemon in
                Button(action: {
                    store.send(.navigateToDetail)
                }) {
                    PokemonListItem(pokemon: pokemon)
                }
                .onAppear {
                    store.send(.bottomPagination(pokemon.id))
                }
            }
        }
        .padding()
    }
}

#Preview {
    PokemonListView(
        store: Store(initialState: PokemonListStore.State()) {
            PokemonListStore()
        }
    )
}
