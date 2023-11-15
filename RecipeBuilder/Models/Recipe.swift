//
//  Recipe.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 14.11.23.
//

import Foundation

struct Recipe: Codable {
    var recipeNumber: Int = 0
    let title: String
    let author: String
    let time: String
    let servings: String
    let imageName: String
}

extension Recipe {
    static var testData: [Recipe] {
        return [
            Recipe(recipeNumber: 000001, title: "Spinach lasagne", author: "Kris", time: "45 minutes", servings: "8 servings", imageName: "spinach-lasagne"),
            Recipe(recipeNumber: 000002, title: "Pulled pork tacos", author: "Kras", time: "240 minutes", servings: "6 servings", imageName: "pulled-pork-tacos"),
            Recipe(recipeNumber: 000003, title: "Kaiserschmarrn", author: "Kros", time: "40 minutes", servings: "4 servings", imageName: "kaiserschmarrn"),
            Recipe(recipeNumber: 000004, title: "Carrot cake", author: "Krus", time: "100 minutes", servings: "12 servings", imageName: "carrot-cake"),
            Recipe(recipeNumber: 000005, title: "French onion soup", author: "Krys", time: "90 minutes", servings: "6 servings", imageName: "french-onion-soup")
        ]
    }
}
