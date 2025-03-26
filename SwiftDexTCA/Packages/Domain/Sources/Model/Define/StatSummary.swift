//
//  StatSummary.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/26.
//

import DataStore
import Foundation

public struct StatSummary {
    public let name: String
    public let url: String

    public init(_ data: Components.Schemas.StatSummary) {
        name = data.name
        url = data.url
    }
}
