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

    let imageHeight: CGFloat = 80
    var backgroundViewPaddingTop: CGFloat {
        imageHeight / 2
    }

    var body: some View {
        ZStack {
            backgroundView()
                .padding(.top, backgroundViewPaddingTop)
            VStack(spacing: Token.Padding.compact) {
                pokemonImageView()
                    .shadow(radius: Token.Shadow.medium)
                pokemonInfoView()
                    .padding(.bottom, Token.Padding.compact)
            }
        }
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
        .frame(height: imageHeight)
    }

    func pokemonInfoView() -> some View {
        VStack {
            Text("# \(pokemon.id.description)")
                .foregroundStyle(.gray)
                .font(.system(size: Token.FontSize.small))
            Text(pokemon.name)
                .font(.system(size: Token.FontSize.medium))
                .bold()
        }
    }
}

#Preview {
    PokemonListItem(
        pokemon: .init(number: 1)
    )
}
