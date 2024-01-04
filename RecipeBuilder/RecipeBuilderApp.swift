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
    @StateObject var model = Model()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RecipesView()
                .environmentObject(model)
                .onAppear(perform: {
                    recipeDataManager.load { recipes in
                        model.recipes = recipes
                    }
                })
                .onChange(of: scenePhase, perform: { phase in
                    if phase == .inactive {
                        recipeDataManager.save(recipes: model.recipes)
                    }
                })
        }
    }
}
