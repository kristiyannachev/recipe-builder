//
//  RecipesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 13.11.23.
//

import SwiftUI

struct RecipesView: View {
    @ObservedObject var viewModel: RecipesViewModel
    
    init(_ model: Model, category: Recipe.CategoryValue, tabSelection: Binding<Int>) {
        viewModel = RecipesViewModel(model, category: category, tabSelection: tabSelection)
    }
    
    var body: some View {
        List {
            ForEach(viewModel.recipes) { recipe in
                NavigationLink(destination: viewModel.getRecipeDetailView(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarItems(trailing: Button(action: {
            viewModel.showAddRecipeView()
        }, label: {
            Image(systemName: viewModel.showAddRecipeViewImageName)
        }))
        .sheet(isPresented: $viewModel.showAddView, content: {
            NavigationView {
                RecipeEditView(recipe: $viewModel.recipeAdded, isNewRecipe: true)
                    .navigationBarItems(
                        leading: Button(action: {
                            viewModel.cancelAddRecipe()
                        }, label: {
                            Text(viewModel.cancelAddRecipeText)
                        }),
                        trailing: Button(action: {
                            viewModel.addRecipe()
                        }, label: {
                            Text(viewModel.addRecipeText)
                        }))
            }
        })
    }
}

// MARK: Previews
struct RecipesView_Previews: PreviewProvider {
    static var model = MockModel()
    static var category: Recipe.CategoryValue = .other
    @State static var tabSelection = 1
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipesView(model, category: category, tabSelection: $tabSelection)
            }
            
            NavigationView {
                RecipesView(model, category: category, tabSelection: $tabSelection)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
