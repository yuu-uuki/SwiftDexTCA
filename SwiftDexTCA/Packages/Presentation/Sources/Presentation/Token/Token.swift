//
//  Token.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/22.
//

import Foundation

struct Token {

    struct Spacing {
        static let tight: CGFloat = 4
        static let normal: CGFloat = 8
        static let loose: CGFloat = 16
    }

    struct Padding {
        static let compact: CGFloat = 8
        static let regular: CGFloat = 16
        static let generous: CGFloat = 24
    }

    struct CornerRadius {
        static let subtle: CGFloat = 4
        static let standard: CGFloat = 8
        static let pronounced: CGFloat = 12
    }

    struct Shadow {
        static let soft: CGFloat = 2
        static let medium: CGFloat = 4
        static let strong: CGFloat = 8
    }
}
