//
//  StepEditViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 10.01.24.
//

import Foundation
import SwiftUI

class StepEditViewModel: ObservableObject {
    @Binding var recipe: Recipe
    @Published var step: String = ""
    var index = 0
    var isNewStep: Bool {
        index == recipe.steps.count
    }
    let stepTextFieldText = "Enter step here"
    var navigationTitle: String {
        "\(isNewStep ? "Add" : "Edit") step"
    }
    let saveStepText = "Save"
    
    
    init(recipe: Binding<Recipe>, step: String, index: Int = 0) {
        self._recipe = recipe
        self.step = step
        self.index = index
    }
    
    
    func saveStep() {
        if isNewStep {
            recipe.steps.append(step)
        } else {
            recipe.steps[index] = step
        }
        step = ""
    }
}
