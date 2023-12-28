//
//  AddIngredientView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 27.12.23.
//

import SwiftUI

struct AddIngredientView: View {
    @Binding var recipe: Recipe
    @State var ingredient = Ingredient()

    var body: some View {
        Form {
            Picker(selection: $ingredient.content, label: Text("Content")) {
                ForEach(IngredientContent.allCases, id: \.self) { ingredientContent in
                    Text("\(ingredientContent.asCapitalisedText) \(ingredientContent.rawValue)")
                }
            }
            
            TextField("Value", value: $ingredient.value, format: .number)
            
            Picker(selection: $ingredient.measurement, label: Text("Measurement")) {
                ForEach(IngredientMeasurement.allCases, id: \.self) { ingredientMeasurement in
                    Text(ingredientMeasurement.rawValue)
                }
            }
        }
        .navigationTitle("Add ingredient")
        .navigationBarItems(trailing: Button(action: {
            recipe.ingredients.append(ingredient)
            ingredient = Ingredient()
        }, label: {
            Text("Save")
        }))
    }
}

// MARK: Previews
struct AddIngredientView_Previews: PreviewProvider {
    @State static var testRecipe = Recipe.testData[0]

    static var previews: some View {
        Group {
            AddIngredientView(recipe: $testRecipe)
            
            AddIngredientView(recipe: $testRecipe)
                .preferredColorScheme(.dark)
        }
    }
}
