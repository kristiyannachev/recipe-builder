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
    @Published var showAddView = false
    @Published var recipeAdded = Recipe()
    let navigationTitle = "Recipes"
    let cancelAddRecipeText = "Cancel"
    let addRecipeText = "Done"
    let showAddRecipeViewImageName = "plus"
    var recipes: [Recipe] {
        model.recipes
    }
    
    
    init(_ model: Model) {
        self.model = model
    }
    
    
    func showAddRecipeView() {
        showAddView = true
    }
    
    func cancelAddRecipe() {
        showAddView = false
    }
    
    func addRecipe() {
        showAddView = false
        recipeAdded.imageName = "backup"
        model.recipes.append(recipeAdded)
        recipeAdded = Recipe()
    }
    
    func getRecipeDetailView(recipe: Recipe) -> some View {
        RecipeDetailView(model, recipe: recipe)
    }
    
//    func getRecipeAddView() -> some View {
//        RecipeEditView(model, recipe: recipeAdded, isNewRecipe: true)
//    }
}
