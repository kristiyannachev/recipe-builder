//
//  MockModel.swift
//  RecipeBuilder
//
//  Created by Kristiyan Nachev on 6.01.24.
//

import Foundation
import UIKit

class MockModel: Model {
    convenience init() {
        let recipes = [Recipe(title: "Spinach lasagne",
                             author: "Kris",
                             time: .fourtyFive,
                             servings: .eight,
                             imageName: "spinach-lasagne",
                             image: Data(),
                             ingredients: [
                               Ingredient(content: .pasta, measurement: .grams, value: 500),
                               Ingredient(content: .spinach, measurement: .grams, value: 500),
                               Ingredient(content: .cheese, measurement: .kilograms, value: 1),
                               Ingredient(content: .egg, measurement: .pieces, value: 3),
                               Ingredient(content: .onion, measurement: .pieces, value: 1),
                               Ingredient(content: .garlic, measurement: .slices, value: 2),
                               Ingredient(content: .oliveOil, measurement: .tablespoons, value: 2),
                               Ingredient(content: .milk, measurement: .mililiters, value: 1200),
                               Ingredient(content: .butter, measurement: .grams, value: 60),
                               Ingredient(content: .flour, measurement: .grams, value: 60),
                               Ingredient(content: .salt, measurement: .miligrams, value: 8)
                             ],
                             steps: [
                              "For the béchamel, fry the flour until golden in the heated butter.",
                              "Gradually, stirring constantly, pour in the milk. Cook until the sauce thickens slightly. It should remain slightly thinner than usual because the crusts are uncooked and will absorb the liquid. Turn off the heat and season with the mustard, salt and pepper.",
                              "Saute the onion and garlic and fry them in the olive oil until soft and glassy.",
                              "Pour boiling water over the spinach to soften. Then cool it under cold running water and drain very well, squeezing it with your hands. Chop it finely.",
                              "Mix the spinach, grated Parmesan, crumbled gorgonzola and ricotta. Mix well. Add the fried onion and garlic, eggs, nutmeg, salt and pepper to taste and mix well again.",
                              "Pour the bechamel on the bottom of the baking dish. Arrange the lasagne crusts on top. Pour over the béchamel, sprinkle over some of the spinach mixture and arrange the mozzarella slices. Alternate in this way until you run out of products. Finish with the crusts, béchamel and mozzarella.",
                              "Preheat the oven to 180 degrees with a fan. Bake the lasagne for 40 minutes. Allow to cool slightly, cut and serve."
                             ])
                  ]
        let itemOne = Ingredient(content: .butter, measurement: .grams, value: 60)
        let itemTwo = Ingredient(content: .milk, measurement: .mililiters, value: 550)
        let items = [itemOne, itemTwo]
        self.init(recipes: recipes, shoppingCartItems: items)
    }
}
