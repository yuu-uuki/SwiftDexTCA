//
//  Pokemon.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore
import Foundation

public struct Pokemon {
    public let id: Int
    public let name: String
    public let spriteImageUrl: URL?
    public let officialArtworkImageUrl: URL?

    public init?(_ summary: Components.Schemas.PokemonSummary) {
        guard let number = PokemonUtility.extractPokemonID(from: summary.url) else {
            return nil
        }
        id = number
        name = summary.name
        spriteImageUrl = PokemonUtility.getSpriteImageURL(from: summary.url)
        officialArtworkImageUrl = PokemonUtility.getOfficialArtworkURL(from: summary.url)
    }

    public init(number: Int) {
        id = number
        name = "testName\(number)"
        spriteImageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(number).png")
        officialArtworkImageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png")
    }
}

