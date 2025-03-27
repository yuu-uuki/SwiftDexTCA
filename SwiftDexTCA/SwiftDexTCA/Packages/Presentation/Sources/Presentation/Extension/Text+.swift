//
//  Text+.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/24.
//

import SwiftUI

extension Text {

    func fontStyle(_ style: FontStyle) -> some View {
        self.font(.system(size: style.fontSize))
            .fontWeight(style.weight)
            .foregroundStyle(style.color)
    }
}
