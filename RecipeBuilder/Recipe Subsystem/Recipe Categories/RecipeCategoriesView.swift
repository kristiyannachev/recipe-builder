//
//  RecipeCategoriesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 16.01.24.
//

import SwiftUI

struct RecipeCategoriesView: View {
    @ObservedObject var viewModel: RecipeCategoriesViewModel
    
    init(_ model: Model) {
        viewModel = RecipeCategoriesViewModel(model)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Recipe.CategoryValue.allCases, id: \.self) { category in
                    NavigationLink(destination: viewModel.getRecipesListView(category: category)) {
                        Text(viewModel.getCategoryRowText(category: category))
                            .categoryRowHeadline()
                    }
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
    }
}

// MARK: Previews
struct RecipeCategoriesView_Previews: PreviewProvider {
    static var model = MockModel()
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipeCategoriesView(model)
            }
            
            NavigationView {
                RecipeCategoriesView(model)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
