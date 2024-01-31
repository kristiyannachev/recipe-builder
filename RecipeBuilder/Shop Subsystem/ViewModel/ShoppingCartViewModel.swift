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
    let deleteShoppingCartItemButtonText = AppStrings.ShoppingCart.deleteShoppingCartItemButtonText
    var shoppingCartItemsPending: [ShoppingCartItem] {
        model.shoppingCartItems.filter { $0.state == .pending }
    }
    var shoppingCartItemsDone: [ShoppingCartItem] {
        model.shoppingCartItems.filter { $0.state == .done }
    }
    
    init(_ model: Model) {
        self.model = model
    }
    
    
    func getShoppingCartItemText(item: ShoppingCartItem) -> String {
        "\(item.ingredient.content.asReadableString) \(item.ingredient.content.emoji)   \(item.ingredient.value) \(item.ingredient.measurement.rawValue)"
    }
    
    func deleteItem(_ item: ShoppingCartItem) {
        model.deleteShoppingCartItem(item: item)
    }
    
    func getShoppingCartItemView(item: ShoppingCartItem) -> some View {
        ShoppingCartItemView(model, item: item)
    }
}
