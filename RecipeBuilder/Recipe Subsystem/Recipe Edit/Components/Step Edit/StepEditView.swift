//
//  StepEditView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 1.01.24.
//

import SwiftUI

struct StepEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: StepEditViewModel
    
    init(recipe: Binding<Recipe>, step: String = "", index: Int = 0) {
        viewModel = StepEditViewModel(recipe: recipe, step: step, index: index)
    }

    var body: some View {
        Form {
            TextField(viewModel.stepTextFieldText, text: $viewModel.step,  axis: .vertical)
                .lineLimit(1...20)
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarItems(trailing: Button(action: {
            viewModel.saveStep()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text(viewModel.saveStepText)
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
