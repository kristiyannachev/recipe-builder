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
    
    init(_ model: Model) {
    }
    
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
                                recipeAdded.imageName = "backup"
                                model.recipes.append(recipeAdded)
                                recipeAdded = Recipe()
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
    static var model = MockModel()
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipesView(model)
            }
            
            NavigationView {
                RecipesView(model)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
