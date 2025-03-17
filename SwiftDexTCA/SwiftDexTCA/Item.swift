//
//  Item.swift
//  SwiftDexTCA
//
//  Created by 田中裕貴 on 2025/03/17.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
