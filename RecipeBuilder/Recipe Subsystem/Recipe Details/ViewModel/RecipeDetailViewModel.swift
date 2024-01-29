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
    let imageHeight: CGFloat = AppConstants.RecipeDetail.imageHeight
    let imageCornerRadius: CGFloat = AppConstants.RecipeDetail.imageCornerRadius
    let spacing: CGFloat = AppConstants.RecipeDetail.spacing
    // Recipe info
    let recipeInfoHeadline = AppStrings.RecipeDetail.recipeInfoHeadline
    let addToCartText = AppStrings.RecipeDetail.addToCartText
    let addToCartImageName = AppStrings.RecipeDetail.addToCartImageName
    var authorText: String {
        recipe.author
    }
    let authorImageName = AppStrings.RecipeDetail.authorImageName
    var categoryText: String {
        recipe.category.rawValue
    }
    let categoryImageName = AppStrings.RecipeDetail.categoryImageName
    var timeText: String {
        "\(recipe.time.rawValue) \(AppStrings.RecipeDetail.restTimeText)"
    }
    let timeImageName = AppStrings.RecipeDetail.timeImageName
    var servingsText: String {
        "\(recipe.servings.rawValue) \(AppStrings.RecipeDetail.restServingsText)"
    }
    let servingsImageName = AppStrings.RecipeDetail.servingsImageName
    // Ingredients
    let ingredientsInfoHeadline = AppStrings.RecipeDetail.ingredientsInfoHeadline
    // Steps
    let stepsInfoHeadline = AppStrings.RecipeDetail.stepsInfoHeadline
    // Edit recipe
    let showEditRecipeText = AppStrings.RecipeDetail.showEditRecipeText
    // Save recipe
    let cancelSaveRecipeText = AppStrings.RecipeDetail.cancelSaveRecipeText
    let saveRecipeText = AppStrings.RecipeDetail.saveRecipeText
    
    
    init(_ model: Model, recipe: Recipe) {
        self.model = model
        self.recipe = recipe
    }
    
    
    func getIngredientText(_ ingredient: Ingredient) -> String {
        "\(ingredient.content.asReadableString) \(ingredient.content.emoji)   \(ingredient.value) \(ingredient.measurement.rawValue)"
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
    
    func getImage() -> Image {
        if recipe.image == Data() {
            return Image(recipe.imageName)
        }
        return Image(uiImage: UIImage(data: recipe.image) ?? UIImage())
    }
    
    func addRecipeItemsToCart() {
        model.addShoppingCartItems(itemsToAdd: recipe.ingredients)
    }
}
