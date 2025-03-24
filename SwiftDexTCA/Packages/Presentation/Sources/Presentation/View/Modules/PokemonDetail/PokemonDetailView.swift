//
//  PokemonDetailView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/24.
//

import SwiftUI
import ComposableArchitecture

struct PokemonDetailView: View {

    let store: StoreOf<PokemonDetailStore>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonDetailView(
        store: Store(initialState: PokemonDetailStore.State()) {
            PokemonDetailStore()
        }
    )
}
