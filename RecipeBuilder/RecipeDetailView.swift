//
//  RecipeDetailView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 15.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var model: Model
    @Binding var recipe: Recipe
    @State private var showEditView = false
    @State private var recipeEdited = Recipe()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Image(recipe.imageName)
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Recipe info")
                        .sectionHeadline(isDark: colorScheme == .dark)
                    Label(recipe.author, systemImage: "person")
                    HStack() {
                        Label("\(recipe.time.rawValue) minutes", systemImage: "clock")
                        Spacer()
                        Label("\(recipe.servings.rawValue) servings", systemImage: "fork.knife")
                    }
                }
                .info(isDark: colorScheme == .dark)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .sectionHeadline(isDark: colorScheme == .dark)
                    ForEach(recipe.ingredients) { ingredient in
                        HStack {
                            Text("\(ingredient.content.rawValue) \(ingredient.content.emoji)   \(ingredient.value) \(ingredient.measurement.rawValue)")
                                .info(isDark: colorScheme == .dark)
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Steps")
                        .sectionHeadline(isDark: colorScheme == .dark)
                    ForEach(Array(zip(recipe.steps.indices, recipe.steps)), id: \.0) { index, step in
                        Text("\(index+1). \(step)")
                            .fixedSize(horizontal: false, vertical: true)
                            .info(isDark: colorScheme == .dark)
                    }
                    
                }.foregroundColor(.accentColor)
                
                Spacer()
            }
            .padding(.all)
            .navigationTitle(recipe.title)
            .navigationBarItems(trailing: Button(action: {
                recipeEdited = recipe
                showEditView = true
            }, label: {
                Text("Edit")
            }))
            .sheet(isPresented: $showEditView, content: {
                NavigationView {
                    RecipeEditView(recipe: $recipeEdited)
                        .navigationBarItems(
                            leading: Button(action: {
                                showEditView = false
                            }, label: {
                                Text("Cancel")
                            }),
                            trailing: Button(action: {
                                showEditView = false
                                recipe = recipeEdited
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
struct RecipeDetailView_Previews: PreviewProvider {
    @State static var testRecipe = Recipe.testData[0]

    static var previews: some View {
        Group {
            NavigationView {
                RecipeDetailView(recipe: $testRecipe)
            }
            
            NavigationView {
                RecipeDetailView(recipe: $testRecipe)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
