//
//  View+.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/26.
//

import SwiftUI

extension View {

    func setNavigationTitleImage(_ image: Image) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigation) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 0)
            }
        }
        .configureNavigationBarHiddenTitle()
    }

    func configureNavigationBarHiddenTitle() -> some View {
        self.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.clear, for: .navigationBar)
    }
}
