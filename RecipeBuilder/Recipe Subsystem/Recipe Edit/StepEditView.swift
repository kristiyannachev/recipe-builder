//
//  StepEditView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 1.01.24.
//

import SwiftUI

struct StepEditView: View {
    @Binding var recipe: Recipe
    @State var step: String = ""
    var index = 0
    private var isNewStep: Bool {
        index == recipe.steps.count
    }

    var body: some View {
        Form {
            TextField("Enter step here", text: $step,  axis: .vertical)
                .lineLimit(1...20)
        }
        .navigationTitle("\(isNewStep ? "Add" : "Edit") step")
        .navigationBarItems(trailing: Button(action: {
            if isNewStep {
                recipe.steps.append(step)
            } else {
                recipe.steps[index] = step
            }
            step = ""
        }, label: {
            Text("Save")
        }))
    }
}

struct StepEditView_Preview: PreviewProvider {
    @State static var testRecipe = MockModel().recipes[0]

    static var previews: some View {
        Group {
            NavigationView {
                StepEditView(recipe: $testRecipe)
            }
            
            NavigationView {
                StepEditView(recipe: $testRecipe)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
