//
//  IngredientAddView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 27.12.23.
//

import SwiftUI

struct IngredientAddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var recipe: Recipe
    @State private var ingredient = Ingredient()

    var body: some View {
        Form {
            Picker(selection: $ingredient.content, label: Text("Content")) {
                ForEach(Ingredient.IngredientContent.allCases, id: \.self) { ingredientContent in
                    Text("\(ingredientContent.rawValue) \(ingredientContent.emoji)")
                }
            }
            .pickerStyle(DefaultPickerStyle())
            
            TextField("Value", value: $ingredient.value, format: .number)
            
            Picker(selection: $ingredient.measurement, label: Text("Measurement")) {
                ForEach(Ingredient.IngredientMeasurement.allCases, id: \.self) { ingredientMeasurement in
                    Text(ingredientMeasurement.rawValue)
                }
            }
            .pickerStyle(DefaultPickerStyle())
        }
        .navigationTitle("Add ingredient")
        .navigationBarItems(trailing: Button(action: {
            recipe.ingredients.append(ingredient)
            ingredient = Ingredient()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
        }))
    }
}

// MARK: Previews
struct AddIngredientView_Previews: PreviewProvider {
    @State static var testRecipe = MockModel().recipes[0]

    static var previews: some View {
        Group {
            IngredientAddView(recipe: $testRecipe)
            
            IngredientAddView(recipe: $testRecipe)
                .preferredColorScheme(.dark)
        }
    }
}
