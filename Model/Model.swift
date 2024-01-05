//
//  Model.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 4.01.24.
//

import Foundation

class Model: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        self.recipes = []
    }
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
