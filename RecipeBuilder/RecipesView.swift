//
//  RecipesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

struct RecipesView: View {
    @State var recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipes: Recipe.testData)
    }
}
