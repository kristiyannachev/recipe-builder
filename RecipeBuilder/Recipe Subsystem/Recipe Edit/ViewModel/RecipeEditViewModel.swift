//
//  RecipeEditViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 10.01.24.
//

import Foundation
import SwiftUI

class RecipeEditViewModel: ObservableObject {
    @Binding var recipe: Recipe
    var isNewRecipe: Bool
    @Published private var ingredient = Ingredient()
    
    let recipeInfoSectionText = "Recipe info"
    let recipeTitleTextFieldText = "Recipe title"
    let authorTextFieldText = "Author"
    let timeText = "Time"
    let servingsText = "Servings"
    let ingredientsSectionText = "Ingredients"
    let removeIngredientImageName = "minus.circle"
    let addImageName = "plus"
    let spacing: CGFloat = 10
    let ingredientValueTextFieldText = "Value"
    let ingredientValueTextFieldTextWidth: CGFloat = 60
    let ingredientMeasurementWidth: CGFloat = 35
    let stepsSectionText = "Steps"
    var navigationTitle: String {
        "\(isNewRecipe ? "Add" : "Edit") recipe"
    }
    
    
    init(recipe: Binding<Recipe>, isNewRecipe: Bool = false) {
        self._recipe = recipe
        self.isNewRecipe = isNewRecipe
    }
    
    
    func getTimeValueText(_ timeValue: Recipe.TimeValue) -> String {
        timeValue.rawValue
    }
    
    func getServingsValueText(_ servingsValue: Recipe.ServingsValue) -> String {
        servingsValue.rawValue
    }
    
    func getIngredientContentText(_ ingredient: Ingredient) -> String {
        "\(ingredient.content.rawValue) \(ingredient.content.emoji)"
    }
    
    func getIngredientMeasurementText(_ ingredient: Ingredient) -> String {
        ingredient.measurement.rawValue
    }
    
    func getIngredientIndex(_ ingredient: Ingredient) -> Int {
        recipe.ingredients.firstIndex(where: {$0.id == ingredient.id })!
    }
    
    func getIngredientForBinding(index ingredientIndex: Int) -> Binding<Ingredient> {
        $recipe.ingredients[ingredientIndex]
    }
    
    func removeIngredient(_ ingredient: Ingredient) {
        let ingredientIndex = recipe.ingredients.firstIndex(where: {$0.id == ingredient.id })!
        recipe.ingredients.remove(at: ingredientIndex)
    }
}
