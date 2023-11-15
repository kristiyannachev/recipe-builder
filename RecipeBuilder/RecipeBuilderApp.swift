//
//  RecipeBuilderApp.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

@main
struct RecipeBuilderApp: App {
    var body: some Scene {
        WindowGroup {
            RecipesView(recipes: Recipe.testData)
        }
    }
}
