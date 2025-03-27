//
//  PokemonDetail.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/26.
//

import DataStore
import Foundation

public struct PokemonDetail: Equatable {
    public let id: Int
    public let name: String
    public let baseExperience: Int?
    public let physiqueType: [PhysiqueType]
    public let abilities: [AbilitiePayload]
    public let stats: [PokemonStat]
    public let types: [TypePayload]
    public let officialArtworkImageUrl: URL?

    public init(_ detail: Components.Schemas.PokemonDetail) {
        id = detail.id
        name = detail.name
        baseExperience = detail.base_experience
        physiqueType = [.height(detail.height), .weight(detail.weight)]
        abilities = detail.abilities.compactMap { AbilitiePayload($0) }
        stats = detail.stats.compactMap { PokemonStat($0) }
        types = detail.types.compactMap { TypePayload($0) }
        officialArtworkImageUrl = URL(string: PokemonUtility.getOfficialArtworkURL(from: detail.id))
    }

    public init() {
        id = 1
        name = "bulbasaur"
        baseExperience = 64
        physiqueType = [.height(7), .weight(69)]
        abilities = [.init()]
        stats = [.init()]
        types = [.init()]
        officialArtworkImageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(1).png")
    }

    public struct TypePayload: Equatable {
        public let type: PokemonType
        public let url: String

        public init?(_ data: Components.Schemas.PokemonDetail.typesPayloadPayload) {
            guard let pokemonType = PokemonType(rawValue: data._type.name) else {
                return nil
            }
            type = pokemonType
            url = data._type.url
        }
        public init() {
            type = .init(rawValue: "grass")!
            url = "https://pokeapi.co/api/v2/type/12/"
        }
    }

    public struct AbilitiePayload: Equatable {
        public let name: String
        public let url: String

        public init(_ data: Components.Schemas.PokemonDetail.abilitiesPayloadPayload) {
            name = data.ability.name
            url = data.ability.url
        }

        public init() {
            name = "overgrow"
            url = "https://pokeapi.co/api/v2/ability/65/"
        }
    }
}

