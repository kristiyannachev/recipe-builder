//
//  RecipesViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 9.01.24.
//

import Foundation
import SwiftUI

class RecipesViewModel: ObservableObject {
    private var model: Model
    private var category: Recipe.CategoryValue
    @Binding var tabSelection: Int
    @Published var showAddView = false
    @Published var recipeAdded = Recipe()
    var navigationTitle: String {
        "\(category.rawValue) \(AppStrings.Recipes.navigationTitle)"
    }
    let cancelAddRecipeText = AppStrings.Recipes.cancelAddRecipeText
    let addRecipeText = AppStrings.Recipes.addRecipeText
    let showAddRecipeViewImageName = AppStrings.Recipes.showAddRecipeViewImageName
    var recipes: [Recipe] {
        model.getRecipesForCategory(category: category)
    }
    
    
    init(_ model: Model, category: Recipe.CategoryValue, tabSelection: Binding<Int>) {
        self.model = model
        self.category = category
        self._tabSelection = tabSelection
        self.recipeAdded.category = category
    }
    
    
    func showAddRecipeView() {
        showAddView = true
    }
    
    func cancelAddRecipe() {
        showAddView = false
    }
    
    func addRecipe() {
        showAddView = false
        recipeAdded.imageName = AppStrings.Recipes.backupImageName
        model.recipes.append(recipeAdded)
        recipeAdded = Recipe()
    }
    
    func getRecipeDetailView(recipe: Recipe) -> some View {
        RecipeDetailView(model, recipe: recipe, tabSelection: $tabSelection)
    }
}
