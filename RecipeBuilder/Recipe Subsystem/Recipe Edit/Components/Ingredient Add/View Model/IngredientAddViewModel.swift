//
//  IngredientAddViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 10.01.24.
//

import Foundation
import SwiftUI

class IngredientAddViewModel: ObservableObject {
    @Binding var recipe: Recipe
    @Published var ingredient = Ingredient()
    let contentTextFieldText = AppStrings.IngredientAdd.contentTextFieldText
    let valueTextFieldText = AppStrings.IngredientAdd.valueTextFieldText
    let measurementPickerText = AppStrings.IngredientAdd.measurementPickerText
    let navigationTitle = AppStrings.IngredientAdd.navigationTitle
    let saveIngredientText = AppStrings.IngredientAdd.saveIngredientText

    
    init(recipe: Binding<Recipe>, ingredient: Ingredient = Ingredient()) {
        self._recipe = recipe
        self.ingredient = ingredient
    }
    
    
    func getIngredientContentText(_ ingredientContent: Ingredient.IngredientContent) -> String {
        "\(ingredientContent.rawValue) \(ingredientContent.emoji)"
    }
    
    func getIngredientMeasurementText(_ ingredientMeasurement: Ingredient.IngredientMeasurement) -> String {
        ingredientMeasurement.rawValue
    }
    
    func saveIngredient() {
        recipe.ingredients.append(ingredient)
        ingredient = Ingredient()
    }
}
