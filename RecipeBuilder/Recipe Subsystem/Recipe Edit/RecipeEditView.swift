//
//  RecipeEditView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 21.12.23.
//

import SwiftUI

struct RecipeEditView: View {
    @ObservedObject var viewModel: RecipeEditViewModel
    @State var showingImagePicker = false
    @State var inputImage: UIImage?
    
    init(recipe: Binding<Recipe>, isNewRecipe: Bool) {
        viewModel = RecipeEditViewModel(recipe: recipe, isNewRecipe: isNewRecipe)
    }
    
    var body: some View {
        Form {
            Section(header: Text(viewModel.imageSectionText)) {
                ZStack(alignment: .center) {
                    ZStack(alignment: .topTrailing) {
                        viewModel.getImage()
                            .resizable()
                            .frame(height: viewModel.imageHeight)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: viewModel.imageCornerRadius))
                        
                        VStack {
                            Button("") {
                                showingImagePicker = true
                            }
                            .buttonStyle(EditImageButtonStyle())
                        }.padding(viewModel.imageButtonPadding)
                    }
                }
            }
            
            Section(header: Text(viewModel.recipeInfoSectionText)) {
                TextField(viewModel.recipeTitleTextFieldText, text: $viewModel.recipe.title)
                    .disableAutocorrection(true)
                
                TextField(viewModel.authorTextFieldText, text: $viewModel.recipe.author)
                    .disableAutocorrection(true)

                Picker(selection: $viewModel.recipe.time, label: Text(viewModel.timeText)) {
                    ForEach(Recipe.TimeValue.allCases, id: \.self) { timeValue in
                        Text(viewModel.getTimeValueText(timeValue))
                    }
                }
                .pickerStyle(DefaultPickerStyle())

                Picker(selection: $viewModel.recipe.servings, label: Text(viewModel.servingsText)) {
                    ForEach(Recipe.ServingsValue.allCases, id: \.self) { servings in
                        Text(viewModel.getServingsValueText(servings))
                    }
                }
                .pickerStyle(DefaultPickerStyle())
            }
            
            Section(header: Text(viewModel.ingredientsSectionText)) {
                ForEach(viewModel.recipe.ingredients) {
                    ingredient in
                    let ingredientIndex = viewModel.getIngredientIndex(ingredient)
                    let ingredientBinding = viewModel.getIngredientForBinding(index: ingredientIndex)
                    
                    HStack(alignment: .center, spacing: viewModel.spacing) {
                        Text(viewModel.getIngredientContentText(ingredient))
                        
                        Spacer()
                        
                        TextField(viewModel.ingredientValueTextFieldText, value: ingredientBinding.value, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: viewModel.ingredientValueTextFieldTextWidth)
                        
                        Text(viewModel.getIngredientMeasurementText(ingredient))
                            .frame(width: viewModel.ingredientMeasurementWidth)
                        
                        Button(action: {
                            viewModel.removeIngredient(ingredient)
                        }, label: {
                            Image(systemName: viewModel.removeIngredientImageName)
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
                        Image(systemName: viewModel.addImageName)
                        Spacer()
                    }
                    .foregroundColor(.accentColor)
                    
                    NavigationLink(destination: IngredientAddView(recipe: $viewModel.recipe)) {
                        Rectangle()
                    }
                    .opacity(0)
                }
            }
            
            Section(header: Text(viewModel.stepsSectionText)) {
                List($viewModel.recipe.steps, id: \.self, editActions: .all) { $step in
                    let stepIndex = viewModel.recipe.steps.firstIndex(where: {$0 == step })!
                    
                    NavigationLink(destination: StepEditView(recipe: $viewModel.recipe, step: step, index: stepIndex)) {
                        Text(step)
                    }
                }
                // For adding a new ingredient
                ZStack {
                    HStack {
                        Spacer()
                        Image(systemName: viewModel.addImageName)
                        Spacer()
                    }
                    .foregroundColor(.accentColor)
                    
                    NavigationLink(destination: StepEditView(recipe: $viewModel.recipe, index: viewModel.recipe.steps.count)) {
                        Rectangle()
                    }
                    .opacity(0)
                }
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let data = inputImage.jpegData(compressionQuality: viewModel.imageCompressionQuality) ?? Data()
        viewModel.recipe.image = data
    }
}

struct RecipeEditView_Preview: PreviewProvider {
    @State static var testRecipe = MockModel().recipes[0]

    static var previews: some View {
        Group {
            NavigationView {
                RecipeEditView(recipe: $testRecipe, isNewRecipe: false)
            }
            
            NavigationView {
                RecipeEditView(recipe: $testRecipe, isNewRecipe: false)
                    .preferredColorScheme(.dark)
            }
        }
    }

}
