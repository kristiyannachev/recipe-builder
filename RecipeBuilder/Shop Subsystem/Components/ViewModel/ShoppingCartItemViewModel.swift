//
//  ShoppingCartItemViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 31.01.24.
//

import Foundation
import SwiftUI

class ShoppingCartItemViewModel: ObservableObject {
    private var model: Model
    let navigationTitle = AppStrings.ShoppingCart.navigationTitle
    var shoppingCartItems: [ShoppingCartItem] {
        model.shoppingCartItems
    }
    
    init(_ model: Model) {
        self.model = model
    }
    
    
    func getShoppingCartItemText(item: ShoppingCartItem) -> String {
        "\(item.ingredient.content.asReadableString) \(item.ingredient.content.emoji)   \(item.ingredient.value) \(item.ingredient.measurement.rawValue)"
    }
    
    func setDoneItem(_ item: ShoppingCartItem) {
        model.deleteShoppingCartItem(item: item)
        let itemCopy = ShoppingCartItem(ingredient: item.ingredient, state: item.state == .done ? .pending : .done)
        model.addShoppingCartItems(itemsToAdd: [itemCopy])
    }
}
