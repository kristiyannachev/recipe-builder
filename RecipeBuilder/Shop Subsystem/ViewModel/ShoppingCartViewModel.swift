//
//  ShoppingCartViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 26.01.24.
//

import Foundation
import SwiftUI

class ShoppingCartViewModel: ObservableObject {
    private var model: Model
    let navigationTitle = AppStrings.ShoppingCart.navigationTitle
    var shoppingCartItems: [Ingredient] {
        model.shoppingCartItems
    }
    
    init(_ model: Model) {
        self.model = model
    }
    
    
    func getShoppingCartItemText(item: Ingredient) -> String {
        "\(item.content.asReadableString) \(item.content.emoji)   \(item.value) \(item.measurement.rawValue)"
    }
    
    func deleteItem(_ item: Ingredient) {
        model.deleteShoppingCartItem(item: item)
    }
}
