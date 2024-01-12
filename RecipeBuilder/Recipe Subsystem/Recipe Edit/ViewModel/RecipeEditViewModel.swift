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
    
    // Image
    let imageSectionText = AppStrings.RecipeEdit.imageSectionText
    let imageHeight: CGFloat = AppConstants.RecipeEdit.imageHeight
    let imageCornerRadius: CGFloat = AppConstants.RecipeEdit.imageCornerRadius
    let editImageImageName = AppStrings.RecipeEdit.editImageImageName
    let imageCompressionQuality = AppConstants.RecipeEdit.imageCompressionQuality
    // Recipe info
    let recipeInfoSectionText = AppStrings.RecipeEdit.recipeInfoSectionText
    let recipeTitleTextFieldText = AppStrings.RecipeEdit.recipeTitleTextFieldText
    let authorTextFieldText = AppStrings.RecipeEdit.authorTextFieldText
    let timeText = AppStrings.RecipeEdit.timeText
    let servingsText = AppStrings.RecipeEdit.servingsText
    // Ingredients
    let ingredientsSectionText = AppStrings.RecipeEdit.ingredientsSectionText
    let removeIngredientImageName = AppStrings.RecipeEdit.removeIngredientImageName
    let addImageName = AppStrings.RecipeEdit.addImageName
    let spacing: CGFloat = AppConstants.RecipeEdit.spacing
    let ingredientValueTextFieldText = AppStrings.RecipeEdit.ingredientValueTextFieldText
    let ingredientValueTextFieldTextWidth: CGFloat = AppConstants.RecipeEdit.ingredientValueTextFieldTextWidth
    let ingredientMeasurementWidth: CGFloat = AppConstants.RecipeEdit.ingredientMeasurementWidth
    // Steps
    let stepsSectionText = AppStrings.RecipeEdit.stepsSectionText
    var navigationTitle: String {
        "\(isNewRecipe ? AppStrings.RecipeEdit.addRecipeTitle : AppStrings.RecipeEdit.editRecipeTitle) \(AppStrings.RecipeEdit.restRecipeTitle)"
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
    
    func getImage() -> Image {
        if recipe.image == Data() {
            return Image(recipe.imageName)
        }
        return Image(uiImage: UIImage(data: recipe.image) ?? UIImage())
    }
}
