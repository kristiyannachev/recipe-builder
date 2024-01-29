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
    private var shoppingCartDataManager = ShoppingCartDataManager()

    @StateObject var model = Model()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
                .onAppear(perform: {
                    recipeDataManager.load { recipes in
                        model.recipes = recipes
                    }
                    shoppingCartDataManager.load { items in
                        model.shoppingCartItems = items
                    }
                })
                .onChange(of: scenePhase, perform: { phase in
                    if phase == .inactive {
                        recipeDataManager.save(recipes: model.recipes)
                        shoppingCartDataManager.save(items: model.shoppingCartItems)
                    }
                })
        }
    }
}
