//
//  RecipeRow.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import SwiftUI

struct RecipeRow: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: RecipeRowViewModel
    
    init(recipe: Recipe) {
        viewModel = RecipeRowViewModel(recipe: recipe)
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                viewModel.getImage()
                    .resizable()
                    .frame(width: viewModel.imageWidth, height: viewModel.imageHeight, alignment: .leading)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: viewModel.imageCornerRadius))
                
                VStack(alignment: .leading, spacing: viewModel.spacing) {
                    Text(viewModel.recipe.title)
                        .recipeRowHeadlineNoPadding(isDark: colorScheme == .dark)
                    VStack(alignment: .leading) {
                        Label(viewModel.authorText, systemImage: viewModel.authorImageName)
                        Label(viewModel.timeText, systemImage: viewModel.timeImageName)
                        Label(viewModel.servingsText, systemImage: viewModel.servingsImageName)
                    }
                    .recipeRowInfo(isDark: colorScheme == .dark)
                }
                
                Spacer()
            }
        }.padding(.trailing)
    }
}

// MARK: Previews
struct RecipeRow_Previews: PreviewProvider {
    static var model = MockModel()
    static var testRecipe = model.recipes[0]
    
    static var previews: some View {
        Group {
            RecipeRow(recipe: testRecipe)
                .previewLayout(.fixed(width: 400, height: 100))
            
            RecipeRow(recipe: testRecipe)
                .previewLayout(.fixed(width: 400, height: 100))
                .preferredColorScheme(.dark)
        }
    }
}
