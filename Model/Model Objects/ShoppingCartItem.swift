//
//  ShoppingCartItem.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 31.01.24.
//

import Foundation

struct ShoppingCartItem: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var ingredient: Ingredient
    var state: ShoppingCartItemState = .pending
    
    enum ShoppingCartItemState: String, Codable, CaseIterable {
        case pending = "Pending"
        case done = "Done"
    }
}
