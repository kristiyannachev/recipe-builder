//
//  RecipesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

struct RecipesView: View {
    @EnvironmentObject private var model: Model
    @State private var showAddView = false
    @State private var recipeAdded = Recipe()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.recipes) { recipe in
                    let recipeIndex = model.recipes.firstIndex(where: {
                        $0.id == recipe.id
                    })!
                    
                    let recipeBinding = $model.recipes[recipeIndex]
                    
                    NavigationLink(destination: RecipeDetailView (recipe: recipeBinding)) {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
            .navigationBarItems(trailing: Button(action: {
                showAddView = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showAddView, content: {
                NavigationView {
                    RecipeEditView(recipe: $recipeAdded, isNewRecipe: true)
                        .navigationBarItems(
                            leading: Button(action: {
                                showAddView = false
                            }, label: {
                                Text("Cancel")
                            }),
                            trailing: Button(action: {
                                showAddView = false
                                recipeAdded.recipeNumber = model.recipes.count + 1
                                recipeAdded.imageName = "backup"
                                model.recipes.append(recipeAdded)
                            }, label: {
                                Text("Done")
                            }))
                }
            })
        }
        .environmentObject(model)
    }
}

// MARK: Previews
struct RecipesView_Previews: PreviewProvider {
    static var model = Model(recipes: Recipe.testData)
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipesView()
                    .environmentObject(model)
            }
            
            NavigationView {
                RecipesView()
                    .environmentObject(model)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
