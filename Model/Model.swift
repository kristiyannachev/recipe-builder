//
//  Model.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 4.01.24.
//

import Foundation

class Model: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var shoppingCartItems: [Ingredient] = []
    
    init(recipes: [Recipe] = [], shoppingCartItems: [Ingredient] = []) {
        self.recipes = recipes
        self.shoppingCartItems = shoppingCartItems
    }
    
    func saveRecipe(recipe: Recipe) {
        recipes = recipes.replacingOldElement(withNewElement: recipe)
    }
    
    func getRecipesForCategory(category: Recipe.CategoryValue) -> [Recipe] {
        recipes.filter{ $0.category == category }
    }
    
    func addShoppingCartItems(itemsToAdd items: [Ingredient]) {
        shoppingCartItems.append(contentsOf: items)
    }
    
    func deleteShoppingCartItem(item: Ingredient) {
        shoppingCartItems.removeAll{ $0.id == item.id }
    }
}

extension Array where Element: Identifiable {

    /// Replaces an old element with the specified new element, basing the
    /// matching on the `id` property.
    ///
    /// - Parameter newElement: The new, replacement element.
    func replacingOldElement<T: Identifiable>(withNewElement newElement: T) -> [T] {
        var newElements = [T]()

        self.forEach {
            if let item = $0 as? T {
                if item.id == newElement.id {
                    newElements.append(newElement)
                } else {
                    newElements.append(item)
                }
            }
        }

        return newElements
    }
}
