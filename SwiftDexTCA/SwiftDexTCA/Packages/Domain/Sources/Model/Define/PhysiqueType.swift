//
//  PhysiqueType.swift
//  Domain
//
//  Created by 田中裕貴 on 2025/03/27.
//

public enum PhysiqueType {
    case weight(Int?)
    case height(Int?)
}

extension PhysiqueType {

    public var title: String {
        switch self {
        case .weight:
            return "Weight"
        case .height:
            return "Height"
        }
    }

    public var valueText: String {
        switch self {
        case let .weight(value):
            return String(format: "%.1f kg", Double(value ?? 0) * 0.1)
        case let .height(value):
            return String(format: "%.1f m", Double(value ?? 0) * 0.1)
        }
    }
}
