//
//  Categories.swift
//  TodoAppSwiftUI3
//
//  Created by Roman Luzgin on 21.06.21.
//

import Foundation
import SwiftUI

struct ItemCategory: Identifiable, Hashable {
    let id = UUID()
    
    var category: String
    var color: Color
}

let categories = [
    ItemCategory(category: "Work", color: Color.cyan),
    ItemCategory(category: "Home", color: Color.indigo),
]
