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
    case bodyMiddle
    case description
    case descriptionMiddle
    case descriptionLarge
    case descriptionMiddleBold
}

extension FontStyle {

    var fontSize: CGFloat {
        switch self {
        case .description:
            return Token.FontSize.small
        case .titleMiddle,
             .bodyMiddle,
             .descriptionMiddle,
             .descriptionMiddleBold:
            return Token.FontSize.medium
        case .titleLarge,
             .descriptionLarge:
            return Token.FontSize.large
        case .titleExtraLarge:
            return Token.FontSize.extraLarge
        }
    }

    var weight: Font.Weight {
        switch self {
        case .titleMiddle,
             .titleLarge,
             .titleExtraLarge,
             .descriptionMiddleBold:
            return .bold
        case .bodyMiddle,
             .description,
             .descriptionMiddle,
             .descriptionLarge:
            return .regular
        }
    }

    var color: Color {
        switch self {
        case .titleMiddle,
             .titleLarge,
             .titleExtraLarge,
             .bodyMiddle:
            return Color(.pokemonFgText)
        case .description,
             .descriptionMiddle,
             .descriptionLarge,
             .descriptionMiddleBold:
            return .gray
        }
    }
}
