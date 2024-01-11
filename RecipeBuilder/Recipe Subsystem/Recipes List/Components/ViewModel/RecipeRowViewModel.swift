//
//  RecipeRowViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 11.01.24.
//

import Foundation

class RecipeRowViewModel: ObservableObject {
    var recipe: Recipe
    
    let imageWidth: CGFloat = AppConstants.RecipeRow.imageWidth
    let imageHeight: CGFloat = AppConstants.RecipeRow.imageHeight
    let imageCornerRadius: CGFloat = AppConstants.RecipeRow.imageCornerRadius
    let spacing: CGFloat = AppConstants.RecipeRow.spacing    
    let recipeInfoHeadline = AppStrings.RecipeRow.recipeInfoHeadline
    var authorText: String {
        recipe.author
    }
    let authorImageName = AppStrings.RecipeRow.authorImageName
    var timeText: String {
        "\(recipe.time.rawValue) \(AppStrings.RecipeRow.restTimeText)"
    }
    let timeImageName = AppStrings.RecipeRow.timeImageName
    var servingsText: String {
        "\(recipe.servings.rawValue) \(AppStrings.RecipeRow.restServingsText)"
    }
    let servingsImageName = AppStrings.RecipeRow.servingsImageName
    
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
