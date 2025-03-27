//
//  Token.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/22.
//

import Foundation
import SwiftUI

struct Token {

    struct FontSize {
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let large: CGFloat = 20
        static let extraLarge: CGFloat = 24
    }

    struct Spacing {
        static let tight: CGFloat = 4
        static let normal: CGFloat = 8
        static let loose: CGFloat = 16
        static let extraLoose: CGFloat = 24
    }

    struct Padding {
        static let xCompact: CGFloat = 4
        static let compact: CGFloat = 8
        static let regular: CGFloat = 16
        static let generous: CGFloat = 24
    }

    struct CornerRadius {
        static let subtle: CGFloat = 4
        static let standard: CGFloat = 8
        static let pronounced: CGFloat = 12
        static let pronouncedLarger: CGFloat = 24
    }

    struct Shadow {
        static let soft: CGFloat = 2
        static let medium: CGFloat = 4
        static let strong: CGFloat = 8
    }

    struct GridLayout {
        static let threeColumns = columns(count: 3)
        static func columns(count: Int) -> [GridItem] {
            return Array(repeating: GridItem(.flexible()), count: count)
        }
    }
}
