//
//  Model.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 4.01.24.
//

import Foundation

class Model: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
    
    func saveRecipe(recipe: Recipe) {
        recipes = recipes.replacingOldElement(withNewElement: recipe)
    }
    
    func getRecipesForCategory(category: Recipe.CategoryValue) -> [Recipe] {
        recipes.filter{ $0.category == category }
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
