//
//  WeightHeightView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/27.
//

import SwiftUI

struct WeightHeightView: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontStyle(.descriptionMiddle)
            Text(value)
                .fontStyle(.titleMiddle)
                .frame(maxWidth: .infinity)
                .padding(.vertical, Token.Padding.compact)
                .background {
                    RoundedRectangle(cornerRadius: Token.CornerRadius.standard)
                        .fill(.clear)
                        .stroke(.gray, lineWidth: 1)
                }
        }
    }
}

