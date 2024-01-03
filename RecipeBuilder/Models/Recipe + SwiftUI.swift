//
//  Recipe + SwiftUI.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import SwiftUI

extension Recipe: Identifiable {
    var id: Int {
        self.recipeNumber
    }
}

extension Ingredient: Identifiable {
    var id: Int {
        self.ingredientNumber
    }
}
