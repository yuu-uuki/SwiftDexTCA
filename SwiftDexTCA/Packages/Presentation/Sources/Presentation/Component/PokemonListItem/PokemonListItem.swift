//
//  SwiftUIView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/21.
//

import Domain
import SwiftUI

struct PokemonListItem: View {

    let pokemon: Pokemon
    let componentHeight: CGFloat = 200

    var body: some View {
        ZStack {
            backgroundView()
                .padding(.top, componentHeight / 4)
            VStack(spacing: Token.Padding.compact) {
                pokemonImageView()
                    .frame(maxWidth: .infinity)
                pokemonInfoView()
                    .padding(.bottom, Token.Padding.regular)
            }
        }
        .frame(height: componentHeight)
    }
}

private extension PokemonListItem {

    func backgroundView() -> some View {
        RoundedRectangle(cornerRadius: Token.CornerRadius.pronounced)
            .fill(.white)
            .shadow(radius: Token.Shadow.medium)
    }

    func pokemonImageView() -> some View {
        AsyncImage(url: pokemon.officialArtworkImageUrl) { image in
            image.resizable()
        } placeholder: {
            Image(.pokemonLogo)
                .resizable()
        }
        .scaledToFit()
    }

    func pokemonInfoView() -> some View {
        VStack(spacing: Token.Spacing.tight) {
            Text("# \(pokemon.id.description)")
                .font(.title3)
                .foregroundStyle(.gray)
            Text(pokemon.name)
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    PokemonListItem(
        pokemon: .init(number: 1)
    )
}
