//
//  RecipeCategoriesView.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 16.01.24.
//

import SwiftUI

struct RecipeCategoriesView: View {
    @ObservedObject var viewModel: RecipeCategoriesViewModel
    
    init(_ model: Model, tabSelection: Binding<Int>) {
        viewModel = RecipeCategoriesViewModel(model, tabSelection: tabSelection)
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
    @State static var tabSelection = 1
    
    static var previews: some View {
        Group {
            NavigationView {
                RecipeCategoriesView(model, tabSelection: $tabSelection)
            }
            
            NavigationView {
                RecipeCategoriesView(model, tabSelection: $tabSelection)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
