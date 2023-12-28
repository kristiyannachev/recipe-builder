//
//  RecipeDetailView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 15.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    @State private var showEditView = false
    @State private var recipeEdited = Recipe()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Image(recipe.imageName)
                        .resizable()
                        .frame(width: 350, height: 250)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Label(recipe.author, systemImage: "person")
                    HStack() {
                        Label("\(recipe.time.rawValue) minutes", systemImage: "clock")
                        Spacer()
                        Label("\(recipe.servings.rawValue) servings", systemImage: "fork.knife")
                    }
                }.foregroundColor(.accentColor)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.content.rawValue) { ingredient in
                        HStack {
                            Text("\(ingredient.content.asCapitalisedText) \(ingredient.content.rawValue)  \(ingredient.value)\(ingredient.measurement.rawValue)")
                        }
                    }
                }.foregroundColor(.accentColor)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Steps")
                        .font(.headline)
                    ForEach(Array(zip(recipe.steps.indices, recipe.steps)), id: \.0) { index, step in
                        Text("\(index+1). \(step)")
                            .fixedSize(horizontal: false, vertical: true)
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