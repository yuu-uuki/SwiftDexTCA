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

    let imageHeight: CGFloat = 100
    var backgroundViewPaddingTop: CGFloat {
        imageHeight / 2
    }

    var body: some View {
        ZStack {
            backgroundView()
                .padding(.top, backgroundViewPaddingTop)
            VStack(spacing: Token.Padding.compact) {
                pokemonImageView()
                    .shadow(color: Color(.pokemonFgShadow).opacity(0.1), radius: Token.Shadow.soft)
                pokemonInfoView()
                    .padding(.bottom, Token.Padding.compact)
            }
        }
    }
}

private extension PokemonListItem {

    func backgroundView() -> some View {
        RoundedRectangle(cornerRadius: Token.CornerRadius.pronounced)
            .fill(Color(.pokemonItemBg))
            .shadow(color: Color(.pokemonFgShadow).opacity(0.1), radius: Token.Shadow.medium, y: 2)
    }

    func pokemonImageView() -> some View {
        AsyncImage(url: pokemon.officialArtworkImageUrl) { image in
            image.resizable()
        } placeholder: {
            Image(.pokemonLogo)
                .resizable()
        }
        .scaledToFit()
        .frame(height: imageHeight)
    }

    func pokemonInfoView() -> some View {
        VStack {
            Text("# \(pokemon.id.description)")
                .pokemonIDStyle()
            Text(pokemon.name)
                .pokemonNameStyle()
        }
    }
}

#Preview {
    PokemonListItem(
        pokemon: .init(number: 1)
    )
}
