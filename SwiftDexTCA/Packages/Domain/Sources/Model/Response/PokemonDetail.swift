//
//  PokemonDetail.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/26.
//

import DataStore
import Foundation

public struct PokemonDetail {
    public let id: Int
    public let name: String
    public let baseExperience: Int?
    public let height: Int?
    public let weight: Int?
    public let abilities: [AbilitiePayload]
    public let sprites: SpritesPayload
    public let stats: [PokemonStat]
    public let types: [TypePayload]

    public init(_ detail: Components.Schemas.PokemonDetail) {
        id = detail.id
        name = detail.name
        baseExperience = detail.base_experience
        height = detail.height
        weight = detail.weight
        abilities = detail.abilities.compactMap { AbilitiePayload($0) }
        sprites = .init(detail.sprites)
        stats = detail.stats.map { PokemonStat($0) }
        types = detail.types.map { TypePayload($0) }
    }

    public struct SpritesPayload {
        public let frontDefault: String?
        public let additionalProperties: [String: String?]

        public init(_ data: Components.Schemas.PokemonDetail.spritesPayload) {
            frontDefault = data.front_default
            additionalProperties = data.additionalProperties
        }
    }

    public struct TypePayload {
        public let name: String
        public let url: String

        public init(_ data: Components.Schemas.PokemonDetail.typesPayloadPayload) {
            name = data._type.name
            url = data._type.url
        }
    }

    public struct AbilitiePayload {
        public let name: String
        public let url: String

        public init(_ data: Components.Schemas.PokemonDetail.abilitiesPayloadPayload) {
            name = data.ability.name
            url = data.ability.url
        }
    }
}

