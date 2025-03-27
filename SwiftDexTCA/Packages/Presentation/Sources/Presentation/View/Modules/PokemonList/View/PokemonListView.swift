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

        content()
            .setNavigationTitleImage(Image(.pokemonLogo))
            .navigation(store: $store)
    }
}

private extension PokemonListView {

    func content() -> some View {
        ScrollView {
            gridView()
        }
        .background(Color(.pokemonBg))
        .onAppear {
            store.send(.fetchInitialPokemonList)
        }
        .refreshable {
            store.send(.refreshPokemonList)
        }
    }

    func gridView() -> some View {
        LazyVGrid(columns: Token.GridLayout.threeColumns, spacing: Token.Spacing.normal) {
            ForEach(store.state.pokemonList, id: \.id) { pokemon in
                Button(action: {
                    store.send(.navigateToScreen(.pokemonDetail(pokemon.id)))
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

// MARK: - Screen Transitions
private extension View {

    func navigation(store: Bindable<StoreOf<PokemonListStore>>) -> some View {
        self.navigationDestination(
            item: store.scope(
                state: \.destination?.pokemonDetail,
                action: \.destination.pokemonDetail
            )
        ) { store in
            PokemonDetailView(store: store)
        }
    }
}

// MARK: - Preview
#Preview {
    PokemonListView(
        store: Store(initialState: PokemonListStore.State()) {
            PokemonListStore()
        }
    )
}
