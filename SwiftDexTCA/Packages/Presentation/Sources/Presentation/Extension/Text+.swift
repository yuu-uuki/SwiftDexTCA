//
//  Text+.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/24.
//

import SwiftUI

extension Text {

    func pokemonIDStyle() -> Text {
        self
            .foregroundColor(.gray)
            .font(.system(size: Token.FontSize.small))
    }

    func pokemonNameStyle() -> Text {
        self
            .font(.system(size: Token.FontSize.medium))
            .foregroundColor(Color(.pokemonFgText))
            .bold()
    }
}
