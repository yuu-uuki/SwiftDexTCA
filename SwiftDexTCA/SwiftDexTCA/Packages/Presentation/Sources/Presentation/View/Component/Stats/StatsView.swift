//
//  StatsView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/27.
//

import Domain
import SwiftUI

struct StatsView: View {
    let stat: PokemonStat
    let color: Color?

    var body: some View {
        HStack(spacing: Token.Spacing.loose) {
            Text(stat.statType.name)
                .fontStyle(.descriptionMiddle)
                .frame(width: 64, alignment: .leading)
            Text(stat.baseStat.description)
                .fontStyle(.titleMiddle)
                .frame(width: 30)

            statsProgressView(
                value: stat.baseStat,
                total: stat.statType.maxValue,
                color: color
            )
        }
    }
}

extension StatsView {

    func statsProgressView(value: Int, total: Int, color: Color?) -> some View {
        ProgressView(
            value: CGFloat(value),
            total: CGFloat(total)
        )
        .tint(color)
        .scaleEffect(x: 1, y: 2)
        .frame(maxWidth: .infinity)
    }
}
