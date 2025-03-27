//
//  TypeTagView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/27.
//

import SwiftUI

struct TypeTagView: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .fontStyle(.titleMiddle)
            .padding(.horizontal, Token.Padding.regular)
            .padding(.vertical, Token.Padding.compact)
            .background(color.opacity(0.6))
            .clipShape(Capsule())
    }
}
