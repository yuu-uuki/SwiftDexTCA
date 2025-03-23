//
//  PokemonListView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/23.
//

import SwiftUI
import ComposableArchitecture

struct PokemonListView: View {

    let store: StoreOf<PokemonListStore>

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Token.GridLayout.threeColumns, spacing: Token.Spacing.normal) {
                ForEach(store.state.pokemonList, id: \.id) { pokemon in
                    PokemonListItem(pokemon: pokemon)
                }
            }
            .padding()
        }
        .onAppear {
            store.send(.fetchPokemonList)
        }
    }
}

#Preview {
    PokemonListView(
        store: Store(initialState: PokemonListStore.State()) {
            PokemonListStore()
        }
    )
}
