//
//  FeatureView.swift
//  Presentation
//
//  Created by 田中裕貴 on 2025/03/19.
//

import SwiftUI
import ComposableArchitecture

struct FeatureView: View {
  let store: StoreOf<Feature>

  var body: some View {
    Form {
      Section {
        Text("\(store.count)")
        Button("Decrement") { store.send(.decrementButtonTapped) }
        Button("Increment") { store.send(.incrementButtonTapped) }
      }

      Section {
        Button("Number fact") { store.send(.numberFactButtonTapped) }
      }

      if let fact = store.numberFact {
        Text(fact)
      }
    }
  }
}

#Preview {
    FeatureView(
        store: Store(initialState: Feature.State()) {
            Feature()
        }
    )
}
