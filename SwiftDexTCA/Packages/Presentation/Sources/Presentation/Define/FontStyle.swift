//
//  FontStyle.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/27.
//

import Foundation
import SwiftUI

enum FontStyle: String {
    case titleMiddle
    case titleLarge
    case titleExtraLarge
    case description
    case descriptionMiddle
    case descriptionLarge
}

extension FontStyle {

    var fontSize: CGFloat {
        switch self {
        case .titleMiddle:
            return Token.FontSize.medium
        case .titleLarge:
            return Token.FontSize.large
        case .titleExtraLarge:
            return Token.FontSize.extraLarge
        case .description:
            return Token.FontSize.small
        case .descriptionMiddle:
            return Token.FontSize.medium
        case .descriptionLarge:
            return Token.FontSize.large
        }
    }

    var weight: Font.Weight {
        switch self {
        case .titleMiddle,
             .titleLarge,
             .titleExtraLarge:
            return .bold
        case .description,
             .descriptionMiddle,
             .descriptionLarge:
            return .regular
        }
    }

    var color: Color {
        switch self {
        case .titleMiddle,
             .titleLarge,
             .titleExtraLarge:
            return Color(.pokemonFgText)
        case .description,
             .descriptionMiddle,
             .descriptionLarge:
            return .gray
        }
    }
}
