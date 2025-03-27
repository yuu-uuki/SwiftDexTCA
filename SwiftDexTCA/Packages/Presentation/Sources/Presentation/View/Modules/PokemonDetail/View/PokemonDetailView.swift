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
        content()
            .configureNavigationBarHiddenTitle()
    }
}

private extension PokemonDetailView {

    func content() -> some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(spacing: Token.Spacing.loose) {
                    pokemonImageContainer(spacerHeight: geometry.safeAreaInsets.top)
                    VStack(spacing: Token.Spacing.extraLoose) {
                        infoView()
                        physiqueContainer()
                        statsContainer()
                    }
                    .padding(.horizontal, Token.Padding.regular)
                }
            }
            .ignoresSafeArea()
            .task {
                store.send(.fetchPokemonDetail)
            }
        }
    }

    func pokemonImageContainer(spacerHeight: CGFloat) -> some View {
        VStack {
            Spacer()
                .frame(height: spacerHeight)
            pokemonImage()
        }
        .frame(maxWidth: .infinity)
        .background(store.state.pokemonDetail?.baseColor?.opacity(0.4))
        .clipShape(.rect(
            bottomLeadingRadius: Token.CornerRadius.pronouncedLarger,
            bottomTrailingRadius: Token.CornerRadius.pronouncedLarger
        ))
    }

    func pokemonImage() -> some View {
        AsyncImage(url: store.state.pokemonDetail?.officialArtworkImageUrl) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .scaledToFit()
        .padding(.horizontal, Token.Spacing.extraLoose)
    }

    func infoView() -> some View {
        HStack {
            Text(store.state.pokemonDetail?.name ?? "")
                .fontStyle(.titleExtraLarge)
            Spacer()
            HStack {
                ForEach(store.state.pokemonDetail?.types ?? [], id: \.type.rawValue) { typePayload in
                    TypeTagView(title: typePayload.type.rawValue, color: typePayload.type.color)
                }
            }
        }
    }

    func physiqueContainer() -> some View {
        HStack {
            ForEach(store.state.pokemonDetail?.physiqueType ?? [], id: \.title) { type in
                WeightHeightView(title: type.title, value: type.valueText)
            }
        }
    }

    func statsContainer() -> some View {
        VStack {
            ForEach(store.state.pokemonDetail?.stats ?? [], id: \.statType) { stats in
                StatsView(stat: stats, color: store.state.pokemonDetail?.baseColor)
            }
        }
    }
}

#Preview {
    PokemonDetailView(
        store: Store(initialState: PokemonDetailStore.State(pokemonId: 1)) {
            PokemonDetailStore()
        }
    )
}
