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
    public let statType: StatType

    public init(_ data: Components.Schemas.PokemonStat) {
        baseStat = data.base_stat
        effort = data.effort
        statType = .init(rawValue: data.stat.name) ?? .none
    }

    public init() {
        baseStat = 45
        effort = 0
        statType = .hp
    }

    public enum StatType: String {
        case hp
        case attack
        case defense
        case specialAttack = "special-attack"
        case specialDefense = "special-defense"
        case speed
        case none

        public var name: String {
            switch self {
            case .hp: 
                return "HP"
            case .attack:
                return "Attack"
            case .defense: 
                return "Defense"
            case .specialAttack: 
                return "Sp.Atk"
            case .specialDefense: 
                return "Sp.Def"
            case .speed: 
                return "Speed"
            case .none:
                return ""
            }
        }

        public var maxValue: Int {
            switch self {
            case .hp:
                return 255
            case .attack:
                return 190
            case .defense:
                return 250
            case .specialAttack:
                return 194
            case .specialDefense:
                return 250
            case .speed:
                return 200
            case .none:
                return 0
            }
        }
    }
}
