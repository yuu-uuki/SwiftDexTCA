//
//  PokemonStat.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/26.
//

import DataStore
import Foundation

public struct PokemonStat {
    public let baseStat: Int
    public let effort: Int
    public let stat: StatSummary

    public init(_ data: Components.Schemas.PokemonStat) {
        baseStat = data.base_stat
        effort = data.effort
        stat = .init(data.stat)
    }
}
