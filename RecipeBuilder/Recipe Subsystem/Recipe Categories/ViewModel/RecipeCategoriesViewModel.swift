//
//  RecipeCategoriesViewModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 16.01.24.
//

import Foundation
import SwiftUI

class RecipeCategoriesViewModel: ObservableObject {
    private var model: Model
    let navigationTitle = AppStrings.Categories.navigationTitle
    
    
    init(_ model: Model) {
        self.model = model
    }
    
    
    private func getCategoryEmoji(category: Recipe.CategoryValue) -> String {
        switch category {
        case.breakfast:
            return "🥞"
        case .soups:
            return "🍲"
        case .chicken:
            return "🐔"
        case .pork:
            return "🐖"
        case .otherMeat:
            return "🐂🦃🐟"
        case .vegetarian:
            return "🧀🥬"
        case .cakes:
            return "🎂"
        case .sweets:
            return "🍯"
        case .other:
            return "🍽️"
        }
    }
    
    func getCategoryRowText(category: Recipe.CategoryValue) -> String {
        "\(category.rawValue) \(getCategoryEmoji(category: category))"
    }
    
    func getRecipesListView(category: Recipe.CategoryValue) -> some View {
        RecipesView(model, category: category)
    }
}
