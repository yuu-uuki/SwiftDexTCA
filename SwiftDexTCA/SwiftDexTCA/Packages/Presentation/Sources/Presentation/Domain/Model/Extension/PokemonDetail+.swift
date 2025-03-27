//
//  PokemonDetail+.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/26.
//

import Domain
import SwiftUICore

extension PokemonDetail {

    var baseColor: Color? {
        self.types.first?.type.color
    }
}
