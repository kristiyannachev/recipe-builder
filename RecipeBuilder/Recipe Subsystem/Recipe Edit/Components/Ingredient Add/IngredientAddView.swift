//
//  IngredientAddView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 27.12.23.
//

import SwiftUI

struct IngredientAddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: IngredientAddViewModel

    init(recipe: Binding<Recipe>) {
        viewModel = IngredientAddViewModel(recipe: recipe)
    }
    
    var body: some View {
        Form {
            Picker(selection: $viewModel.ingredient.content, label: Text(viewModel.contentTextFieldText)) {
                ForEach(Ingredient.IngredientContent.allCases, id: \.self) { ingredientContent in
                    Text(viewModel.getIngredientContentText(ingredientContent))
                }
            }
            .pickerStyle(DefaultPickerStyle())
            
            TextField(viewModel.valueTextFieldText, value: $viewModel.ingredient.value, format: .number)
                .keyboardType(.numberPad)
            
            Picker(selection: $viewModel.ingredient.measurement, label: Text(viewModel.measurementPickerText)) {
                ForEach(Ingredient.IngredientMeasurement.allCases, id: \.self) { ingredientMeasurement in
                    Text(viewModel.getIngredientMeasurementText(ingredientMeasurement))
                }
            }
            .pickerStyle(DefaultPickerStyle())
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarItems(trailing: Button(action: {
            viewModel.saveIngredient()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text(viewModel.saveIngredientText)
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
