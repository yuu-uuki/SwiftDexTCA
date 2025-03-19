//
//  RootView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/19.
//

import SwiftUI
import ComposableArchitecture

public struct RootView: View {
    public var body: some View {
        FeatureView(
            store: Store(initialState: Feature.State()) {
                Feature()
            }
        )
    }

    public init() {}
}

#Preview {
    RootView()
}
