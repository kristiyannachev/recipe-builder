//
//  RecipeDetailViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 10.01.24.
//

import Foundation
import SwiftUI

class RecipeDetailViewModel: ObservableObject {
    private var model: Model
    var recipe: Recipe
    @Published var showEditView = false
    @Published var recipeEdited = Recipe()
    
    // Recipe image
    var recipeImageName: String {
        recipe.imageName
    }
    let imageHeight: CGFloat = 300
    let imageCornerRadius: CGFloat = 15
    let spacing: CGFloat = 10
    // Recipe info
    let recipeInfoHeadline = "Recipe info"
    var authorText: String {
        recipe.author
    }
    let authorImageName = "person"
    var timeText: String {
        "\(recipe.time.rawValue) minutes"
    }
    let timeImageName = "clock"
    var servingsText: String {
        "\(recipe.servings.rawValue) servings"
    }
    let servingsImageName = "fork.knife"
    // Ingredients
    let ingredientsInfoHeadline = "Ingredients"
    // Steps
    let stepsInfoHeadline = "Steps"
    // Edit recipe
    let showEditRecipeText = "Edit"
    // Save recipe
    let cancelSaveRecipeText = "Cancel"
    let saveRecipeText = "Done"
    
    
    init(_ model: Model, recipe: Recipe) {
        self.model = model
        self.recipe = recipe
    }
    
    
    func getIngredientText(_ ingredient: Ingredient) -> String {
        "\(ingredient.content.rawValue) \(ingredient.content.emoji)   \(ingredient.value) \(ingredient.measurement.rawValue)"
    }
    
    func getStepText(index: Int, step: String) -> String {
        "\(index+1). \(step)"
    }
    
    func showEditRecipeView() {
        recipeEdited = recipe
        showEditView = true
    }

    func cancelSaveRecipe() {
        showEditView = false
    }
    
    func saveRecipe() {
        showEditView = false
        recipe = recipeEdited
        model.saveRecipe(recipe: recipe)
    }
    
//    func getRecipeEditView() -> some View {
//        RecipeEditView(model, recipe: recipeEdited, isNewRecipe: false)
//    }
}
