//
//  PokemonType+.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/26.
//

import Domain
import SwiftUICore

extension PokemonType {

    var color: Color {
        switch self {
        case .normal:
            return Color(.normal)
        case .fire:
            return Color(.fire)
        case .water:
            return Color(.water)
        case .electric:
            return Color(.electric)
        case .grass:
            return Color(.grass)
        case .ice:
            return Color(.ice)
        case .fighting:
            return Color(.fighting)
        case .poison:
            return Color(.poison)
        case .ground:
            return Color(.ground)
        case .flying:
            return Color(.flying)
        case .psychic:
            return Color(.psychic)
        case .bug:
            return Color(.bug)
        case .rock:
            return Color(.rock)
        case .ghost:
            return Color(.ghost)
        case .dragon:
            return Color(.dragon)
        case .dark:
            return Color(.dark)
        case .steel:
            return Color(.steel)
        case .fairy:
            return Color(.fairy)
        }
    }
}
