//
//  Pokemon.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/18.
//

import DataStore

public struct Pokemon {
    public let name: String
    public let url: String

    public init(_ summary: Components.Schemas.PokemonSummary) {
        name = summary.name
        url = summary.url
    }
}
