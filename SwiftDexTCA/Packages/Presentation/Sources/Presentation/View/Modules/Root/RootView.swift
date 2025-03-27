//
//  RootView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/19.
//

import SwiftUI
import ComposableArchitecture

public struct RootView: View {
    public var body: some View {
        NavigationStack {
            pokemonListView()
        }
        .tint(Color(.pokemonFgText))
    }

    public init() {}
}

private extension RootView {

    func pokemonListView() -> some View {
        PokemonListView(
            store: Store(initialState: PokemonListStore.State()) {
                PokemonListStore()
            }
        )
    }
}

#Preview {
    RootView()
}
