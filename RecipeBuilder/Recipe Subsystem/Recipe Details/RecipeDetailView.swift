//
//  RecipeDetailView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 15.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel: RecipeDetailViewModel
    
    init(_ model: Model, recipe: Recipe) {
        viewModel = RecipeDetailViewModel(model, recipe: recipe)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    viewModel.getImage()
                        .resizable()
                        .frame(height: viewModel.imageHeight)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: viewModel.imageCornerRadius))
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: viewModel.spacing) {
                    Text(viewModel.recipeInfoHeadline)
                        .sectionHeadline()
                    Label(viewModel.authorText, systemImage: viewModel.authorImageName)
                    HStack() {
                        Label(viewModel.timeText, systemImage: viewModel.timeImageName)
                        Spacer()
                        Label(viewModel.servingsText, systemImage: viewModel.servingsImageName)
                    }
                }
                .info()
                
                Divider()
                
                VStack(alignment: .leading, spacing: viewModel.spacing) {
                    Text(viewModel.ingredientsInfoHeadline)
                        .sectionHeadline()
                    ForEach(viewModel.recipe.ingredients) { ingredient in
                        HStack {
                            Text(viewModel.getIngredientText(ingredient))
                                .info()
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: viewModel.spacing) {
                    Text(viewModel.stepsInfoHeadline)
                        .sectionHeadline()
                    ForEach(Array(zip(viewModel.recipe.steps.indices, viewModel.recipe.steps)), id: \.0) { index, step in
                        Text(viewModel.getStepText(index: index, step: step))
                            .fixedSize(horizontal: false, vertical: true)
                            .info()
                    }
                    
                }.foregroundColor(.accentColor)
                
                Spacer()
            }
            .padding(.all)
            .navigationTitle(viewModel.recipe.title)
            .navigationBarItems(trailing: Button(action: {
                viewModel.showEditRecipeView()
            }, label: {
                Text(viewModel.showEditRecipeText)
            }))
            .sheet(isPresented: $viewModel.showEditView, content: {
                NavigationView {
                    RecipeEditView(recipe: $viewModel.recipeEdited, isNewRecipe: false)
                        .navigationBarItems(
                            leading: Button(action: {
                                viewModel.cancelSaveRecipe()
                            }, label: {
                                Text(viewModel.cancelSaveRecipeText)
                            }),
                            trailing: Button(action: {
                                viewModel.saveRecipe()
                            }, label: {
                                Text(viewModel.saveRecipeText)
                            }))
                }
            })
        }
    }
}

// MARK: Previews
struct RecipeDetailView_Previews: PreviewProvider {
    static var model = MockModel()
    static var testRecipe = model.recipes[0]

    static var previews: some View {
        Group {
            NavigationView {
                RecipeDetailView(model, recipe: testRecipe)
            }
            
            NavigationView {
                RecipeDetailView(model, recipe: testRecipe)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
