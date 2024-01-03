//
//  RecipesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

struct RecipesView: View {
    @Binding var recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    let recipeIndex = recipes.firstIndex(where: {
                        $0.id == recipe.id
                    })!
                    
                    let recipeBinding = $recipes[recipeIndex]
                    
                    NavigationLink(destination: RecipeDetailView (recipe: recipeBinding)) {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

// MARK: Previews
struct RecipesView_Previews: PreviewProvider {
    @State static var testRecipes = Recipe.testData
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipesView(recipes: $testRecipes)
            }
            
            NavigationView {
                RecipesView(recipes: $testRecipes)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
