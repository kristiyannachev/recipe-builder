//
//  RecipeBuilderApp.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

@main
struct RecipeBuilderApp: App {
    private var recipeDataManager = RecipeDataManager()
    @State private var recipes = Recipe.testData
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RecipesView(recipes: self.$recipes)
                .onAppear(perform: {
                    recipeDataManager.load { recipes in
                        self.recipes = recipes
                    }
                })
                .onChange(of: scenePhase, perform: { phase in
                    if phase == .inactive {
                        recipeDataManager.save(recipes: self.recipes)
                    }
                })
        }
    }
}
