//
//  SwiftUIView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/21.
//

import SwiftUI
import ComposableArchitecture

struct PokemonListItem: View {

    let store: StoreOf<PokemonListReducer>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonListItem(store: Store(initialState: PokemonListReducer.State()) {
        PokemonListReducer()
    })
}
