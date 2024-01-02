//
//  RecipeEditView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 21.12.23.
//

import SwiftUI

struct RecipeEditView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Form {
            Section(header: Text("Recipe info")) {
                TextField("Recipe title", text: $recipe.title)
                    .disableAutocorrection(true)
                
                TextField("Author", text: $recipe.author)
                    .disableAutocorrection(true)

                Picker(selection: $recipe.time, label: Text("Time")) {
                    ForEach(Recipe.TimeValue.allCases, id: \.self) { timeValue in
                        Text(timeValue.rawValue)
                    }
                }
                .pickerStyle(DefaultPickerStyle())

                Picker(selection: $recipe.servings, label: Text("Servings")) {
                    ForEach(Recipe.ServingsValue.allCases, id: \.self) { servings in
                        Text(servings.rawValue)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
            }
            
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients) {
                    ingredient in
                    let ingredientIndex = recipe.ingredients.firstIndex(where: {$0.content == ingredient.content })!
                    
                    let ingredientBinding = $recipe.ingredients[ingredientIndex]
                    
                    HStack(alignment: .center, spacing: 10) {
                        Text("\(ingredient.content.asCapitalisedText) \(ingredient.content.rawValue)")
                        
                        Spacer()
                        
                        TextField("Value", value: ingredientBinding.value, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 60)
                        
                        Text(ingredient.measurement.rawValue)
                            .frame(width: 35)
                        
                        Button(action: {
                            recipe.ingredients.remove(at: ingredientIndex)
                        }, label: {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        })
                        .clipped()
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                // For adding a new ingredient
                ZStack {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        Spacer()
                    }
                    .foregroundColor(.accentColor)
                    
                    NavigationLink(destination: AddIngredientView(recipe: $recipe)) {
                        Rectangle()
                    }
                    .opacity(0)
                }
            }
            
            Section(header: Text("Steps")) {
                List($recipe.steps, id: \.self, editActions: .all) { $step in
                    let stepIndex = recipe.steps.firstIndex(where: {$0 == step })!
                    
                    NavigationLink(destination: StepEditView(recipe: $recipe, step: step, index: stepIndex)) {
                        Text(step)
                    }
                }
                // For adding a new ingredient
                ZStack {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        Spacer()
                    }
                    .foregroundColor(.accentColor)
                    
                    NavigationLink(destination: StepEditView(recipe: $recipe, index: recipe.steps.count)) {
                        Rectangle()
                    }
                    .opacity(0)
                }
            }
        }.navigationTitle("Edit recipe")
    }
}

struct RecipeEditView_Preview: PreviewProvider {
    @State static var testRecipe = Recipe.testData[0]

    static var previews: some View {
        Group {
            NavigationView {
                RecipeEditView(recipe: $testRecipe)
            }
            
            NavigationView {
                RecipeEditView(recipe: $testRecipe)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
